import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts/app_colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Axiforma',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: AppColor(context).textColor,
      ),
    );
  }
}
