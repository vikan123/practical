import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryApi {
  final String baseUrl = "https://restcountries.com/v3.1/independent?status=true&fields=name,languages,capital,countries,population";
 var index =5;
  Future<Map<String, dynamic>> getCountryInfo(String countryName) async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body)[index];
      return data;
    } else {
      throw Exception('Failed to load country information');
    }
  }
}
