import 'package:explore_reo/models/data_model.dart';
import 'package:explore_reo/services/api_sevices.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  List<DataModel> _countriesList = [];

  List<DataModel> get getCountriesList => _countriesList;

  bool isChecked0 = false;
  bool get getIsChecked0 => isChecked0;

  void toggleIsChecked0() {
    isChecked0 = !isChecked0;
    notifyListeners();
  }

  bool isChecked1 = false;
  bool get getIsChecked1 => isChecked1;

  void toggleIsChecked1() {
    isChecked1 = !isChecked1;
    notifyListeners();
  }

  bool isChecked2 = false;
  bool get getIsChecked2 => isChecked2;

  void toggleIsChecked2() {
    isChecked2 = !isChecked2;
    notifyListeners();
  }

  bool isChecked3 = false;
  bool get getIsChecked3 => isChecked3;

  void toggleIsChecked3() {
    isChecked3 = !isChecked3;
    notifyListeners();
  }

  bool isChecked4 = false;
  bool get getIsChecked4 => isChecked4;

  void toggleIsChecked4() {
    isChecked4 = !isChecked4;
    notifyListeners();
  }

  bool isChecked5 = false;
  bool get getIsChecked5 => isChecked5;

  void toggleIsChecked5() {
    isChecked5 = !isChecked5;
    notifyListeners();
  }

  bool isChecked6 = false;
  bool get getIsChecked6 => isChecked6;

  void toggleIsChecked6() {
    isChecked6 = !isChecked6;
    notifyListeners();
  }

  Future<List<DataModel>> fetchCountries() async {
    _countriesList = await ApiServices.getAllCountries();
    notifyListeners();
    return _countriesList;
  }

  DataModel findCountryDataByName({required String? common}) {
    return _countriesList
        .firstWhere((element) => element.name!.common == common);
  }

  List<DataModel> fetchCountriesByContinent(
      {required List<DataModel> list, required String continent}) {
    return _countriesList
        .where((element) => element.continents!.first == continent)
        .toList();
  }

  // List<String> languagesList = [];
  //
  // List<String> get getLanguagesList => languagesList;

  // List<String> _countriesNamesList = [];
  // List<String> get getCountriesName => _countriesNamesList;
  // Future<List<String>> fetchCountriesName() async {
  //   List<DataModel> dataModelList =
  //       await fetchCountries().then((value) => value.toList());
  //   for (var v in dataModelList) {
  //     String? countryName = v.name!.common;
  //     _countriesNamesList.add(countryName!);
  //   }
  //   //LinkedHashSet<String>.from(languagesList).toList();
  //   notifyListeners();
  //   return _countriesNamesList;
  // }

  // Future<List<String>> fetchLanguages() async {
  //   List<DataModel> dataModelList =
  //       await fetchCountries().then((value) => value.toList());
  //   for (var v in dataModelList) {
  //     Map languages = v.languages!;
  //     languagesList.add(languages.values.first);
  //   }
  //   //LinkedHashSet<String>.from(languagesList).toList();
  //   notifyListeners();
  //   return languagesList;
  // }
}
