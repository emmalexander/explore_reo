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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: text,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
          GestureDetector(
            onTap: () {
              Navigator.canPop(context) ? Navigator.pop(context) : null;
            },
            child: Container(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10.r)),
              child: const Icon(
                Icons.close,
                size: 15,
                color: Colors.blueGrey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
