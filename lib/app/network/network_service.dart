import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/forecast_response.dart';

class NewtorkService {
  Future<Map<String, String>> getLocation(String city) async {
    // void getLocation(String city) async {
    // http://api.openweathermap.org/geo/1.0/direct?q={city name},{state code},{country code}&limit={limit}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '0c2d51156336b0ba373184d067252b27',
    };

    final uri =
        Uri.https('api.openweathermap.org', '/geo/1.0/direct', queryParameters);
    Uri.http('api.openweathermap.org', '/geo/1.0/direct', queryParameters);

    final response = await http.get(uri);

    final List<dynamic> json = jsonDecode(response.body);

    print(json[0]['lat']);
    print(json[0]['lon']);

    return {'lat': json[0]['lat'].toString(), 'lon': json[0]['lon'].toString()};
  }

  Future<WeatherResponse> getWeather(String city) async {
    final coords = await getLocation(city);
    // api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}
    final queryParameters = {
      'lat': coords['lat'],
      'lon': coords['lon'],
      // 'lat' : '-23.547',
      // 'lon' : '-46.636',
      'appid': '0c2d51156336b0ba373184d067252b27',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/forecast', queryParameters);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
