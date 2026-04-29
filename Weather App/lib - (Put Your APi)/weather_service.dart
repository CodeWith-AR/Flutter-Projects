import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  static const String apiKey = "baa70c676acdaec88bfdbe30a35eaab9";

  Future<Weather> fetchWeather(String city) async {
    final url =
        "fhsdhkjhdjkghajkdsh";

    final response = await http.get(Uri.parse(url));

    print("URL: $url");
    print("Status Code: ${response.statusCode}");
    print("Body: ${response.body}");

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception("City not found or API issue");
    }
  }
}