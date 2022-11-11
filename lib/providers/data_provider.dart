import 'package:explore_reo/models/data_model.dart';
import 'package:explore_reo/services/api_sevices.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  List<DataModel> _countriesList = [];

  List<DataModel> get getCountriesList => _countriesList;

  Future<List<DataModel>> fetchCountries() async {
    _countriesList = await ApiServices.getAllCountries();
    notifyListeners();
    return _countriesList;
  }

  DataModel findCountryDataBytName({required String? common}) {
    return _countriesList
        .firstWhere((element) => element.name!.common == common);
  }
}
