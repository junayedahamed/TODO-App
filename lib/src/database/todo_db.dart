import 'package:hive_flutter/hive_flutter.dart';

class TodoDb {
  List todolist = [];
  // List done = [];
  final _mybox = Hive.box("Task box");
  // final _history = Hive.box("History");

  void firsttimeever() {
    todolist = [
      ["hii", false],
      ["hello", false],
    ];
  }

//load data from db
  void loadfromdb() {
    todolist = _mybox.get("TODOlIST");
  }
//update db

  updatedb() {
    _mybox.put("TODOlIST", todolist);
  }
// //history

//   void initialh() {
//     done = [
//       ["this job is done ", true],
//       ["xyz", true],
//     ];
//   }

//   updatehis() {
//     _history.put("TODOHIST", done);
//   }

//   void loadhist() {
//     done = _history.get("TODOlIST");
//   }
}
