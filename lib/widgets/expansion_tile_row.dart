import 'package:explore_reo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../consts/app_colors.dart';

class ExpansionTileRow extends StatelessWidget {
  const ExpansionTileRow({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    bool? isChecked = false;
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
            value: isChecked,
            onChanged: (val) {
              isChecked = val;
            })
      ],
    );
  }
}
