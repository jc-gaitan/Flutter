import 'package:dio/dio.dart';

import '../models/country.dart';

class CountryService {
  final _dio = new Dio();

  Future getCountryByName(String name) async {
    try {
      final url = 'https://restcountries.com/v3.1/name/$name';
      final resp = await _dio.get(url);

      final List<dynamic> countryList = resp.data;

      return countryList.map((obj) => Country.fromJson(obj)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
