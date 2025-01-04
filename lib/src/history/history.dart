import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/src/database/historydb.dart';
import 'package:todo/src/database/todo_db.dart';
import 'package:todo/src/history/donelist.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final _history = Hive.box("History");
  TodoDb tododb = TodoDb();
  TodoHist todohist = TodoHist();
  @override
  void initState() {
    if (_history.get("TODOHIST") == null) {
      todohist.initialh();
    } else {
      //  todohist.done = _history.get("TODOHIST");
      todohist.loadhist();
    }
    super.initState();
  }

  //done item
  deletefDone(index) {
    setState(() {
      todohist.done.removeAt(index);
    });
    todohist.updatehis();
  }

  void change(int value) async {
    setState(() {
      todohist.done[value][1] = !todohist.done[value][1];
    });
    tododb.todolist.add(
      [
        tododb.todolist[value][0],
        tododb.todolist[value][1],
      ],
    );
    // print(tododb.done);

    await Future.delayed(const Duration(seconds: 1));
    deletefDone(value);
    tododb.updatedb();
    todohist.updatehis();
  }

  @override
  Widget build(BuildContext context) {
    // print(todohist.done);
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text(
              "History",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            pinned: true,
            backgroundColor: Colors.deepPurple,
          ),
          todohist.done.isEmpty
              ? Text("Empty")
              : SliverList.builder(
                  itemCount: todohist.done.length,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: DoneList(
                      todoitem: todohist.done[index][0],
                      completedtask: todohist.done[index][1],
                      check: (value) => change(index),
                      deletef: (val) => deletefDone(index),
                    ),
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todohist.updatehis();
          //tododb.updatedb();
        },
        child: const Text(
          "Load",
        ),
      ),
    );
  }
}
