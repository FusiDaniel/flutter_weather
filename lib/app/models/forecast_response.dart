/* [
      {
        "name": "London",
        "lat": 51.5085,
        "lon": -0.1257,
        "country": "GB"
      }
    ] */

class TempInfo {
  final double temperature;

  TempInfo({required this.temperature});

  factory TempInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TempInfo(temperature: temperature.toDouble());
  }
}

class WeatherResponse {
  final String cityName;
  final List<TempInfo> tempsInfo;

  WeatherResponse({required this.cityName, required this.tempsInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['city']['name'];
    final tempsInfo = List.generate(
        5, (index) => TempInfo.fromJson(json['list'][index]['main']));

    return WeatherResponse(cityName: cityName, tempsInfo: tempsInfo);
  }
}
