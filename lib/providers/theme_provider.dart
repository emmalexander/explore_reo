import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  bool isDark = true;

  get themeMode => _themeMode;

  void themeChange() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (isDark == true) {
      _themeMode = ThemeMode.light;
      isDark = false;
    } else {
      _themeMode = ThemeMode.dark;
      isDark = true;
      print("object");
    }
    await _prefs.setBool('isDark', isDark);
    notifyListeners();
  }

  initialize() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();

    isDark = _pref.getBool('isDark') ?? false;
    notifyListeners();
  }
}
