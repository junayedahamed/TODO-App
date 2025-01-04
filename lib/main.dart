import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/src/app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("Task box");
  await Hive.openBox("History");

  runApp(const MyApp());
}
