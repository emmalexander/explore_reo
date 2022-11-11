import 'package:card_swiper/card_swiper.dart';
import 'package:explore_reo/consts/app_colors.dart';
import 'package:explore_reo/models/data_model.dart';
import 'package:explore_reo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.model}) : super(key: key);
  final DataModel model;
  @override
  Widget build(BuildContext context) {
    List<String?> modelList = [
      model.flags!.png,
      model.coatOfArms!.png,
      model.maps!.openStreetMaps,
    ];
    return Scaffold(
      backgroundColor: AppColor(context).scaffoldColor,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          text: model.name!.common!,
          fontSize: 20,
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 180,
                //width: 300,

                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.network(
                        modelList[index]!,
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  },

                  itemCount: modelList.length,
                  pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.white, activeColor: Colors.red)),
                  // control: const SwiperControl(color: Colors.black),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const TextWidget(
                    text: 'Population: ',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '${model.population}',
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const TextWidget(
                    text: 'Region: ',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '${model.region}',
                    fontSize: 16,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const TextWidget(
                    text: 'Capital: ',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '${model.capital}',
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              Row(
                children: [
                  const TextWidget(
                    text: 'Official language: ',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '${model.languages!.eng}',
                    fontSize: 16,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              Row(
                children: [
                  const TextWidget(
                    text: 'Area: ',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '${model.area.toString()} km2',
                    fontSize: 16,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  TextWidget(
                    text: 'Currency: ',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: 'Euro',
                    fontSize: 16,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              Row(
                children: [
                  const TextWidget(
                    text: 'Time zone: ',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '	${model.timezones![0]}',
                    fontSize: 16,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const TextWidget(
                    text: 'Dialling code: ',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '${model.idd}+${model.idd!.suffixes![0]}',
                    fontSize: 16,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const TextWidget(
                    text: 'Driving side: ',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '${model.car!.side}',
                    fontSize: 16,
                    //fontWeight: FontWeight.w200,
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
