import 'package:hive_flutter/hive_flutter.dart';

class TodoHist {
  List done = [];

  final _history = Hive.box("History");

//history

  void initialh() {
    done = [
      ["this job is done ", true],
      ["xyz", true],
    ];
  }

  updatehis() {
    // print("\n,$done");
    // print("here");
    //  done.add([key, val]);
    _history.put("TODOHIST", done);
  }

  void loadhist() {
    done = _history.get("TODOHIST");
  }
}
