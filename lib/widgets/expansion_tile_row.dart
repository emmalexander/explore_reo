import 'package:explore_reo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../consts/app_colors.dart';

class ExpansionTileRow extends StatelessWidget {
  const ExpansionTileRow({
    Key? key,
    required this.text,
    // required this.checkboxCallback,
    // required this.isChecked,
  }) : super(key: key);
  final String text;
  // final Function(bool?) checkboxCallback;
  // final bool isChecked;

  @override
  Widget build(BuildContext context) {
    //bool? isChecked = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: text,
          color: AppColor(context).textColor,
        ),
        Checkbox(
            fillColor: MaterialStateProperty.all(AppColor(context).textColor),
            checkColor: AppColor(context).scaffoldColor,
            activeColor: AppColor(context).textColor,
            value: false,
            onChanged: (value) {})
      ],
    );
  }
}
