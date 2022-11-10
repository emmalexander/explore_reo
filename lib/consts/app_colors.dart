import 'package:explore_reo/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppColor {
  BuildContext context;
  AppColor(this.context);
  //FF6C00
  //001637

  bool get isDark => Provider.of<ThemeChanger>(context).isDark;
  Color get searchBarColor => isDark
      ? const Color(0xFF98A2B3).withOpacity(.2)
      : const Color(0xFFF2F4F7);
  Color get scaffoldColor =>
      isDark ? const Color(0xFF000F24) : const Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFA9B8D4);
  Color get textColor => isDark ? Colors.white : Colors.black;
  Color get hinTextColor =>
      isDark ? Colors.grey.shade200 : Colors.grey.shade500;
}
