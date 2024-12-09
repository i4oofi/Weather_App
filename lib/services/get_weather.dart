import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather({required String cityName}) async {
    String baseUrl = 'https://api.weatherapi.com/v1';
    String apiKey = '11692888827d484d8a7215822242811';
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 400) {
      throw Exception(data['error']['message']);
    }
    WeatherModel weather = WeatherModel.fromjson(data);
    return weather;
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    String? city = placemarks[0].locality;
    return city ?? '';
  }
}
