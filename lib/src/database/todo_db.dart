import 'package:hive_flutter/hive_flutter.dart';

class TodoDb {
  List todolist = [];
  final _mybox = Hive.box("Task box");

  void firsttimeever() {
    todolist = [
      ["learn flutter", false],
      ["play cricket", false],
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
}
