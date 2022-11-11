import 'dart:developer';

import 'package:explore_reo/consts/app_colors.dart';
import 'package:explore_reo/models/data_model.dart';
import 'package:explore_reo/models/first_letter_model.dart';
import 'package:explore_reo/providers/data_provider.dart';
import 'package:explore_reo/providers/theme_provider.dart';
import 'package:explore_reo/screens/detail_screen.dart';
import 'package:explore_reo/services/api_sevices.dart';
import 'package:explore_reo/widgets/aphabet_scroll_widget.dart';
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

  List<String?> countriesNamesList = [];
  List<DataModel> dataModelList = [];
  //List<String?> get getCountryList => countryList;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _focusNode = FocusNode();
    getData();

    //countryList.add(DataProvider().getCountriesList[0]);
  }

  void getData() async {
    final dataProvider = DataProvider();
    List<DataModel> list = await dataProvider.fetchCountries();
    dataModelList = list;
    //countryList = list.cast<String>();

    for (var e in list) {
      countriesNamesList.add(e.name!.common);
    }
    setState(() {});
    list.sort((a, b) =>
        a.name!.common!.toLowerCase().compareTo(b.name!.common!.toLowerCase()));

    //Future.delayed(const Duration(seconds: 2));
    log('6th Country: ${countriesNamesList[5]}');
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countryProv = Provider.of<DataProvider>(context);
    Future<List> futureList = countryProv.fetchCountries();
    setState(() {});
    //final offstage = !item.isShowSuspension;
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
                style: GoogleFonts.elsieSwashCaps(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor(context).exploreColor),
              ),
              Text(
                '.',
                style: GoogleFonts.elsieSwashCaps(
                    fontSize: 25.sp,
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
              // FutureBuilder(
              //     future: futureList,
              //     builder: (context, snapshot) {
              //       if (snapshot.hasError) {
              //         return Center(
              //           child: TextWidget(
              //               text: 'An error has occurred ${snapshot.error}'),
              //         );
              //       } else if (snapshot.data == null) {
              //         return const Center(
              //           child: TextWidget(text: 'No data found'),
              //         );
              //       }
              //       return
              dataModelList.isEmpty
                  ? const TextWidget(text: 'No data')
                  : Flexible(
                      child: ListView.builder(
                        itemCount: dataModelList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: ListTile(
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.network(
                                    dataModelList[index].flags!.png!),
                              ),
                              title: TextWidget(
                                  text: dataModelList[index].name!.common!),
                              subtitle: TextWidget(
                                text: dataModelList[index].capital!.toString(),
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            model: dataModelList[index])))
                              },
                            ),
                          );
                        },
                      ),
                    )
              // ;
              // })
            ],
          ),
        ),
      ),
    );
  }
}
