import 'package:flutter/material.dart';

class CheckboxL extends ChangeNotifier {
  bool _value = true;
  get getchangevalue => _value;
  change() {
    _value = !_value;

    notifyListeners();
  }
}
