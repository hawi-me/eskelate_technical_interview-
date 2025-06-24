import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country.dart';

class ApiService {
  static const String baseUrl = 'https://restcountries.com/v3.1';

  Future<List<Country>> fetchCountries() async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/independent?status=true&fields=name,population,flag,area,region,subregion,timezones',
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries: ${response.statusCode}');
    }
  }
}
