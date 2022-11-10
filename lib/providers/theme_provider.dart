import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  bool isDark = true;

  get themeMode => _themeMode;

  void themeChange() {
    if (isDark == true) {
      _themeMode = ThemeMode.light;
      isDark = false;
    } else {
      _themeMode = ThemeMode.dark;
      isDark = true;
      print("object");
    }
    notifyListeners();
  }
}
