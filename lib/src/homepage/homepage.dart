import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/src/database/todo_db.dart';

import 'package:todo/src/homepage/add_task.dart';
import 'package:todo/src/listview_of_todo/todo_listview.dart';
import 'package:todo/src/theme/change_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box("Task box");

  TodoDb tododb = TodoDb();
  ToggleSwitch cng = ToggleSwitch.instance;
  @override
  void initState() {
    //checking is the apps opening for 1st time or not
    if (_mybox.get("TODOlIST") == null) {
      tododb.firsttimeever();
    }
    //for already used app
    else {
      tododb.loadfromdb();
    }
    super.initState();
  }

  //final CheckboxL check = CheckboxL();

  deletef(index) {
    setState(() {
      tododb.todolist.removeAt(index);
      //  tododb.
    });
    tododb.updatedb();
  }

  void change(int value) {
    setState(() {
      tododb.todolist[value][1] = !tododb.todolist[value][1];
    });

    tododb.updatedb();
  }

  @override
  Widget build(BuildContext context) {
    //bool? value = true;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text(
              "Todo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            pinned: true,
            backgroundColor: Colors.deepPurple,
            actions: [
              ListenableBuilder(
                  listenable: cng,
                  builder: (context, snapshot) {
                    return IconButton(
                      onPressed: cng.changeTheme,
                      icon: cng.themeIcon,
                    );
                  })
            ],
          ),
          SliverList.builder(
            itemCount: tododb.todolist.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TodoListview(
                todoitem: tododb.todolist[index][0],
                completedtask: tododb.todolist[index][1],
                check: (value) => change(index),
                deletef: (val) => deletef(index),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var task = await showDialog(
            context: context,
            builder: (context) => AddTask(),
          );

          if (task is! String) {
            return;
          } else {
            setState(() {
              tododb.todolist.add([task, false]);
            });
            tododb.updatedb();
          }
        },
        backgroundColor: Colors.deepPurpleAccent,
        hoverColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
