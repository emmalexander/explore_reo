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
      model.maps!.openStreetMaps,
    ];

    Map languages = model.languages!;

    return Scaffold(
      backgroundColor: AppColor(context).scaffoldColor,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          text: model.name!.common!,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
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
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '${model.population}',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Region: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '${model.region}',
                    fontSize: 16.sp,
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
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: model.capital
                        .toString()
                        .replaceAll('[', '')
                        .replaceAll(']', ''),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  TextWidget(
                    text: 'Official language: ',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: languages.values.toList().first ?? 'None',
                    fontSize: 16.sp,
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
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: model.independent! ? 'Yes' : 'No',
                    fontSize: 16.sp,
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
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: model.subregion!,
                    fontSize: 16.sp,
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
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '${model.area.toString()} km2',
                    fontSize: 16.sp,
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
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: 'Euro',
                    fontSize: 16.sp,
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
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '	${model.timezones![0]}',
                    fontSize: 16.sp,
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
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '${model.idd!.root}${model.idd!.suffixes![0]}',
                    fontSize: 16.sp,
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
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '${model.car!.side}',
                    fontSize: 16.sp,
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
