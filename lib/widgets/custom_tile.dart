import 'package:explore_reo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../consts/app_colors.dart';

class CustomTile extends StatelessWidget {
  const CustomTile(
      {Key? key,
      this.onTap,
      required this.image,
      required this.title,
      required this.subtitle})
      : super(key: key);
  final GestureTapCallback? onTap;
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ListTile(
        leading: SizedBox(
          width: 40,
          height: 35,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              width: 40,
              height: 35,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        title: TextWidget(text: title, color: AppColor(context).textColor),
        subtitle: TextWidget(
          text: subtitle,
          color: AppColor(context).subtitleColor,
          fontSize: 14,
        ),
        onTap: onTap,
      ),
    );
  }
}
