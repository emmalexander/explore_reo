import 'package:explore_reo/consts/app_colors.dart';
import 'package:explore_reo/providers/theme_provider.dart';
import 'package:explore_reo/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final TextEditingController _searchTextController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    if (mounted) {
      _searchTextController.dispose();
      _focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor(context).scaffoldColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor(context).scaffoldColor,
          title: Wrap(
            children: [
              Text(
                'Explore',
                style: GoogleFonts.pacifico(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor(context).textColor),
              ),
              Text(
                '.',
                style: GoogleFonts.pacifico(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF6C00)),
              ),
            ],
          ),
          actions: [
            Consumer<ThemeChanger>(builder: (context, themeProv, child) {
              return IconButton(
                  onPressed: () {
                    themeProv.themeChange();
                  },
                  icon: Icon(
                    themeProv.isDark
                        ? Icons.nightlight_outlined
                        : Icons.wb_sunny_outlined,
                    color: AppColor(context).textColor,
                  ));
            })
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                controller: _searchTextController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.w),
                    hintText: 'Search Country',
                    hintStyle: TextStyle(
                        fontFamily: 'Axiforma',
                        fontWeight: FontWeight.w300,
                        color: AppColor(context).hinTextColor
                        //fontSize: 16,

                        ),
                    filled: true,
                    fillColor: AppColor(context).searchBarColor,
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColor(context).textColor,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    //width: 65.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: AppColor.borderColor.withOpacity(.5)),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.globe,
                          color: AppColor(context).textColor,
                        ),
                        SizedBox(width: 4.w),
                        const TextWidget(text: 'EN')
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    //width: 65.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: AppColor.borderColor.withOpacity(.5)),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.filter_alt_outlined,
                          color: AppColor(context).textColor,
                        ),
                        SizedBox(width: 4.w),
                        const TextWidget(text: 'Filter')
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
