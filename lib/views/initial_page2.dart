import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/get_weather.dart';
import 'package:weather/views/search_page.dart';

class InitialPage2 extends StatefulWidget {
  const InitialPage2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InitialPage2State createState() => _InitialPage2State();
}

class _InitialPage2State extends State<InitialPage2> {
  String? cityName;
  WeatherModel? weatherModel; // لتخزين بيانات الطقس

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    try {
      // الحصول على اسم المدينة
      String fetchedCityName = await WeatherService().getCurrentCity();

      // جلب بيانات الطقس
      WeatherModel fetchedWeather =
          await WeatherService().getWeather(cityName: fetchedCityName);

      // تحديث الحالة مع اسم المدينة وبيانات الطقس
      setState(() {
        cityName = fetchedCityName;
        weatherModel = fetchedWeather;
      });
    } catch (e) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(3, -0.3),
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.deepPurple),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-3, -0.3),
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.deepPurple),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -1.2),
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.location_city),
                    color: Colors.blueGrey, // تحديد لون الأيقونة
                    onPressed: () {
                      // الانتقال إلى صفحة البحث عند الضغط على الأيقونة
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SearchPage()), // تأكد من وجود SearchPage
                      );
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Text(
                      cityName ?? 'Fetching city...',
                    ),
                  ),
                  Lottie.asset('assets/images/Animation - 1733490647733.json'),
                  Center(
                    child: Text(
                      '${weatherModel?.avgTemp.round() ?? 'Fetching...'}°C',
                    ),
                  ),
                  Center(
                    child: Text(
                      weatherModel?.condition ?? 'Fetching condition ...',
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
