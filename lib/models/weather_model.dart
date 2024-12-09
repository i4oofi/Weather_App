import 'package:flutter/material.dart';

class WeatherModel {
  String condition;
  double maxTemp;
  double minTemp;
  double avgTemp;
  String dateTime;
  WeatherModel({
    required this.avgTemp,
    required this.condition,
    required this.dateTime,
    required this.maxTemp,
    required this.minTemp,
  });
  static const Map<String, Color> _conditionColors = {
    'Sunny': Colors.yellow,
    'Clear': Colors.orange,
    'Partly Cloudy ': Colors.lightBlueAccent,
    'Cloudy': Colors.grey,
    'Overcast': Colors.blueGrey,
    'Mist': Colors.teal,
    'Patchy rain possible': Colors.lightBlue,
    'Patchy snow possible': Colors.cyan,
    'Patchy sleet possible': Colors.deepPurpleAccent,
    'Fog': Colors.deepOrange,
    'Patchy freezing drizzle possible': Colors.indigoAccent,
    'Thundery outbreaks possible': Colors.purple,
    'Blowing snow': Colors.lightBlueAccent,
    'Blizzard': Colors.white,
    'Freezing fog': Colors.lightGreen,
    'Patchy light drizzle': Colors.lightBlueAccent,
    'Light drizzle': Colors.lightGreenAccent,
    'Freezing drizzle': Colors.indigo,
    'Heavy freezing drizzle': Colors.deepPurple,
    'Patchy light rain': Colors.blueAccent,
    'Light rain': Colors.cyan,
    'Moderate rain at times': Colors.deepOrangeAccent,
    'Moderate rain': Colors.indigoAccent,
    'Heavy rain': Colors.blueAccent,
    'Light freezing rain': Colors.cyanAccent,
    'Moderate or heavy freezing rain': Colors.deepPurpleAccent,
    'Light sleet': Colors.tealAccent,
    'Moderate or heavy sleet': Colors.deepPurpleAccent,
    'Patchy light snow': Colors.blueGrey,
    'Light snow': Colors.white70,
  };

  static const Map<String, String> _conditionImages = {
    'Sunny': 'assets/images/sunny.json',
    'Clear': 'assets/images/clear.json',
    'Partly Cloudy ': 'assets/images/partlycloudy.json',
    'Cloudy': 'assets/images/cloudy.json',
  };

  // دالة للحصول على اللون
  Color getColor() {
    return _conditionColors[condition] ??
        const Color.fromARGB(255, 67, 30, 233);
  }

  // دالة للحصول على الصورة
  String getImage() {
    return _conditionImages[condition] ?? 'assets/images/others.json';
  }

  factory WeatherModel.fromjson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    final dateTime = data['location']['localtime'];
    final maxTemp = jsonData['maxtemp_c'];
    final minTemp = jsonData['mintemp_c'];
    final avgTemp = jsonData['avgtemp_c'];
    final condition = jsonData['condition']['text'];
    return WeatherModel(
        avgTemp: avgTemp,
        condition: condition,
        dateTime: dateTime,
        maxTemp: maxTemp,
        minTemp: minTemp);
  }
}
