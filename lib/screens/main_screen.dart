import 'package:explore_reo/consts/app_colors.dart';
import 'package:explore_reo/models/data_model.dart';
import 'package:explore_reo/providers/data_provider.dart';
import 'package:explore_reo/providers/theme_provider.dart';
import 'package:explore_reo/screens/detail_screen.dart';
import 'package:explore_reo/widgets/custom_tile.dart';
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

  List<DataModel> resultList = [];
  String query = '';
  //List<String?> get getCountryList => countryList;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _focusNode = FocusNode();
    getData();
    DataProvider().fetchCountries().then((List<DataModel> list) {
      setState(() {
        resultList = list;
      });
    });

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

    //log('6th Country: ${countriesNamesList[5]}');
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
          resultList.clear();
        },
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
                  textInputAction: TextInputAction.done,
                  style: TextStyle(color: AppColor(context).textColor),
                  textAlign: TextAlign.center,
                  controller: _searchTextController,
                  focusNode: _focusNode,
                  onChanged: (val) {
                    setState(() {
                      query = val;
                    });
                  },
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
                dataModelList.isEmpty
                    ? const TextWidget(text: 'No data yet')
                    : query.isNotEmpty
                        ? buildSuggestions(query)
                        : Flexible(
                            child: ListView.builder(
                              itemCount: dataModelList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomTile(
                                  image: dataModelList[index].flags!.png!,
                                  title: dataModelList[index].name!.common!,
                                  subtitle: dataModelList[index]
                                      .capital!
                                      .toString()
                                      .replaceAll('[', '')
                                      .replaceAll(']', ''),
                                  onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                model: dataModelList[index])))
                                  },
                                );
                              },
                            ),
                          )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildSuggestions(String query) {
    final List<DataModel> suggestionList = query.isEmpty
        ? []
        : resultList.where((DataModel data) {
            String getCountryName = data.name!.common!.toLowerCase();
            String getCountryCapital = data.capital!
                .toString()
                .replaceAll('[', '')
                .replaceAll(']', '');
            String _query = query.toLowerCase();
            bool matchesName = getCountryName.contains(_query);
            bool matchesCapital = getCountryCapital.contains(_query);

            return (matchesName || matchesCapital);
          }).toList();

    return Flexible(
      child: ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            DataModel searchedCountry = DataModel(
              name: suggestionList[index].name,
              capital: suggestionList[index].capital,
              flags: suggestionList[index].flags,
              coatOfArms: suggestionList[index].coatOfArms,
              maps: suggestionList[index].maps,
              population: suggestionList[index].population,
              region: suggestionList[index].region,
              languages: suggestionList[index].languages,
              area: suggestionList[index].area,
              timezones: suggestionList[index].timezones,
              idd: suggestionList[index].idd,
              car: suggestionList[index].car,
              independent: suggestionList[index].independent,
            );
            return CustomTile(
              image: searchedCountry.flags!.png!,
              title: searchedCountry.name!.common!,
              subtitle: searchedCountry.capital!
                  .toString()
                  .replaceAll('[', '')
                  .replaceAll(']', ''),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(model: searchedCountry)))
              },
            );
          }),
    );
  }
}
