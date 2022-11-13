import 'package:card_swiper/card_swiper.dart';
import 'package:explore_reo/consts/app_colors.dart';
import 'package:explore_reo/models/data_model.dart';
import 'package:explore_reo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.model}) : super(key: key);
  final DataModel model;
  @override
  Widget build(BuildContext context) {
    List<String?> modelList = [
      model.flags!.png,
      model.coatOfArms!.png ??
          'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637',
      //model.maps!.googleMaps,
    ];

    Map languages = model.languages!;
    Map? currencies = model.currencies!;
    Map idds = model.idd!;
    // Map currencyNames = currencies.values.toString() as Map;

    return Scaffold(
      backgroundColor: AppColor(context).scaffoldColor,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          text: model.name!.common!,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: AppColor(context).textColor,
        ),
        elevation: 0,
        backgroundColor: AppColor(context).scaffoldColor,
        leading: BackButton(
          color: AppColor(context).textColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 180.h,
                //width: 300,

                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        modelList[index]!,
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  },
                  itemCount: modelList.length,
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        size: 7,
                        color: Colors.grey,
                        activeColor: Colors.grey.shade200,
                      )),
                  // control: const SwiperControl(color: Colors.black),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Population: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor(context).textColor,
                  ),
                  TextWidget(
                    text: model.population!.toString(),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w100,
                    color: AppColor(context).textColor,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Region: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor(context).textColor,
                  ),
                  TextWidget(
                    text: '${model.region}',
                    fontSize: 16.sp,
                    color: AppColor(context).textColor,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Capital: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor(context).textColor,
                  ),
                  TextWidget(
                    text: model.capital == null
                        ? 'No Capital'
                        : model.capital!.isEmpty
                            ? 'No capital'
                            : model.capital
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', ''),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w100,
                    color: AppColor(context).textColor,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Official language: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor(context).textColor,
                  ),
                  TextWidget(
                    text: languages.isEmpty
                        ? 'No language'
                        : languages.values.toList().first ?? 'No language',
                    fontSize: 16.sp,
                    color: AppColor(context).textColor,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Independence: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor(context).textColor,
                  ),
                  TextWidget(
                    text: model.independent! ? 'Yes' : 'No',
                    fontSize: 16.sp,
                    color: AppColor(context).textColor,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Sub region: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor(context).textColor,
                  ),
                  TextWidget(
                    text: model.subregion == ''
                        ? 'No Sub region'
                        : model.subregion ?? 'No sub region',
                    fontSize: 16.sp,
                    color: AppColor(context).textColor,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Area: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor(context).textColor,
                  ),
                  TextWidget(
                    text: '${model.area.toString()} km2',
                    fontSize: 16.sp,
                    color: AppColor(context).textColor,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Currency: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor(context).textColor,
                  ),
                  TextWidget(
                    text: currencies.isEmpty
                        ? 'No Currency'
                        : currencies.values
                            .toList()
                            .first['name']
                            .toString(), //currencies.values.toString(),
                    fontSize: 16.sp,
                    color: AppColor(context).textColor,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Start of week: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor(context).textColor,
                  ),
                  TextWidget(
                    text: model.startOfWeek!,
                    fontSize: 16.sp,
                    color: AppColor(context).textColor,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Time zone: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor(context).textColor,
                  ),
                  TextWidget(
                    text: '	${model.timezones![0]}',
                    fontSize: 16.sp,
                    color: AppColor(context).textColor,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Dialling code: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor(context).textColor,
                  ),
                  TextWidget(
                    text: model.idd!.isEmpty
                        ? 'No dialling code'
                        : model.idd == null
                            ? 'No dialling code'
                            : '${idds['root'].toString()}${idds['suffixes'][0].toString()}',
                    //: '${model.idd!.root}${model.idd!.suffixes![0]}',
                    fontSize: 16.sp,
                    color: AppColor(context).textColor,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Driving side: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor(context).textColor,
                  ),
                  TextWidget(
                    text: '${model.car!.side}',
                    fontSize: 16.sp,
                    color: AppColor(context).textColor,
                    //fontWeight: FontWeight.w200,
                  ),
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
