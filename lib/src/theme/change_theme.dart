import 'package:flutter/material.dart';

class ToggleSwitch extends ChangeNotifier {
  ToggleSwitch._();
  static ToggleSwitch instance = ToggleSwitch._();
  get themeIcon {
    if (themeMode == ThemeMode.light) {
      return const Icon(
        Icons.dark_mode,
        color: Colors.black,
      );
    } else {
      return const Icon(
        Icons.light_mode,
        color: Colors.white,
      );
    }
  }

  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;
  changeTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
