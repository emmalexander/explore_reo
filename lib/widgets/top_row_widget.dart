import 'package:explore_reo/consts/app_colors.dart';
import 'package:explore_reo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRowWidget extends StatelessWidget {
  const TopRowWidget({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      child: Padding(
        padding: EdgeInsets.only(right: 11.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: text,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColor(context).textColor,
            ),
            GestureDetector(
              onTap: () {
                Navigator.canPop(context) ? Navigator.pop(context) : null;
              },
              child: Container(
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                    color: AppColor(context).xContainerColor,
                    borderRadius: BorderRadius.circular(7.r)),
                child: const Icon(
                  Icons.close,
                  size: 15,
                  color: Colors.blueGrey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
