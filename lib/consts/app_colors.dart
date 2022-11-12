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
  Color get textColor => isDark ? Colors.white.withOpacity(.85) : Colors.black;
  Color get exploreColor =>
      isDark ? Colors.grey.shade200 : const Color(0xFF001637);
  Color get hinTextColor =>
      isDark ? Colors.grey.shade200 : Colors.grey.shade500;
  Color get invisibilityColor =>
      isDark ? const Color(0xFF000711) : const Color(0xFF757575);
  Color get xContainerColor =>
      isDark ? const Color(0xFF3D4A5D) : const Color(0xFFD6DAE1);
}
