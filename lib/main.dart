import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/src/app.dart';

void main() async {
  await Hive.initFlutter();
  var mybox = await Hive.openBox("Task box");

  runApp(const MyApp());
}
