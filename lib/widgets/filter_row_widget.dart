import 'package:explore_reo/consts/api_const.dart';
import 'package:explore_reo/widgets/text_widget.dart';
import 'package:explore_reo/widgets/top_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../consts/app_colors.dart';
import 'expansion_tile_row.dart';

class FilterRowWidget extends StatelessWidget {
  const FilterRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //bool? isChecked = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Container(
                    padding:
                        EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
                    decoration: BoxDecoration(
                        color: AppColor(context).scaffoldColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Wrap(
                      children: [
                        const TopRowWidget(text: 'Languages'),
                        SizedBox(height: 10.h),
                        SizedBox(
                          height: 620.h,
                          child: ListView.builder(
                              itemCount: languageList.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: languageList[index],
                                      color: AppColor(context).textColor,
                                    ),
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                        unselectedWidgetColor:
                                            AppColor(context).textColor,
                                      ),
                                      child: Radio(
                                        activeColor:
                                            AppColor(context).textColor,
                                        focusColor: AppColor(context).textColor,
                                        value: valList[index],
                                        groupValue: valList[2],
                                        onChanged: (val) {
                                          //setState(() {
                                          valList[index] = val;
                                          //});
                                        },
                                        //toggleable: true,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  );
                  // });
                });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            //width: 65.w,
            height: 40.h,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: AppColor.borderColor.withOpacity(.5)),
                borderRadius: BorderRadius.circular(5.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.globe,
                  color: AppColor(context).textColor,
                ),
                SizedBox(width: 4.w),
                TextWidget(
                  text: 'EN',
                  color: AppColor(context).textColor,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    decoration: BoxDecoration(
                        color: AppColor(context).scaffoldColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            topLeft: Radius.circular(20.r))),
                    child: SingleChildScrollView(
                      child: Wrap(children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, bottom: 10.h, left: 15.w, right: 6.w),
                          child: const TopRowWidget(text: 'Filter'),
                        ),
                        SizedBox(height: 10.h),
                        ExpansionTile(
                          childrenPadding:
                              EdgeInsets.only(left: 15.w, right: 5.w),
                          collapsedIconColor: AppColor(context).textColor,
                          title: TextWidget(
                            text: 'Continent',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColor(context).textColor,
                          ),
                          children: const [
                            ExpansionTileRow(text: 'Africa'),
                            ExpansionTileRow(text: 'Antarctica'),
                            ExpansionTileRow(text: 'Asia'),
                            ExpansionTileRow(text: 'Australia'),
                            ExpansionTileRow(text: 'Europe'),
                            ExpansionTileRow(text: 'North America'),
                            ExpansionTileRow(text: 'South America'),
                          ],
                        ),
                        SingleChildScrollView(
                          child: ExpansionTile(
                            childrenPadding:
                                EdgeInsets.only(left: 15.w, right: 5.w),
                            collapsedIconColor: AppColor(context).textColor,
                            title: TextWidget(
                              text: 'Time Zone',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: AppColor(context).textColor,
                            ),
                            children: const [
                              ExpansionTileRow(text: 'GMT+1:00'),
                              ExpansionTileRow(text: 'GMT+2:00'),
                              ExpansionTileRow(text: 'GMT+3:00'),
                              ExpansionTileRow(text: 'GMT+4:00'),
                              ExpansionTileRow(text: 'GMT+5:00'),
                              ExpansionTileRow(text: 'GMT+6:00'),
                              ExpansionTileRow(text: 'GMT+7:00'),
                              ExpansionTileRow(text: 'GMT-6:00'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                //width: 65.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: AppColor.borderColor
                                            .withOpacity(.5)),
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Center(
                                    child: TextWidget(
                                  text: 'Reset',
                                  color: AppColor(context).textColor,
                                )),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 45.w),
                                //width: 65.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    color: AppColor.orangeColor,
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: const Center(
                                    child: TextWidget(
                                  text: 'Show Result',
                                  color: Colors.white,
                                )),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  );
                });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            //width: 65.w,
            height: 40.h,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: AppColor.borderColor.withOpacity(.5)),
                borderRadius: BorderRadius.circular(5.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.filter_alt_outlined,
                  color: AppColor(context).textColor,
                ),
                SizedBox(width: 4.w),
                TextWidget(text: 'Filter', color: AppColor(context).textColor)
              ],
            ),
          ),
        )
      ],
    );
  }
}
