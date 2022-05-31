import 'dart:convert';

import 'package:http/http.dart' as http;

import 'getStructure.dart';

class FetchData {
  static const String apiKey = '04643ff1c678061b7bc3881ccafbe63a';

  Future<Info> fetchInfo() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Dallas&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return Info.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to album');
    }
  }
}
