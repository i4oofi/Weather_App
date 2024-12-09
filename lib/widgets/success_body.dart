import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/views/search_page.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var avgTemp = BlocProvider.of<WeatherCubit>(context).weatherModel?.avgTemp;
    var minTemp = BlocProvider.of<WeatherCubit>(context).weatherModel?.minTemp;
    var maxTemp = BlocProvider.of<WeatherCubit>(context).weatherModel?.maxTemp;
    var condition =
        BlocProvider.of<WeatherCubit>(context).weatherModel?.condition;
    var cityName = BlocProvider.of<WeatherCubit>(context).cityName;
    var getColor =
        BlocProvider.of<WeatherCubit>(context).weatherModel?.getColor();
    var getImage =
        BlocProvider.of<WeatherCubit>(context).weatherModel?.getImage();

    DateTime date = DateTime.now();
    String formattedTime = DateFormat('h:mm a')
        .format(date); // "h:mm a" يعني عرض الوقت بنظام 12 ساعة مع إضافة AM/PM

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0, -1.2),
            child: Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(color: getColor),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 1.2),
            child: Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(color: getColor),
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
              // إضافة أيقونة البحث في الجزء العلوي
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.location_city),
                    color: const Color.fromARGB(
                        255, 51, 66, 73), // تحديد لون الأيقونة
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
              Center(
                child: Text(
                  ' $cityName',
                  style: const TextStyle(
                      fontSize: 42, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '   $formattedTime',
                style: const TextStyle(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Lottie.asset('$getImage', height: 110),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 90),
                    child: Container(
                      margin: const EdgeInsets.only(right: 22),
                      child: Text(
                        '  ${avgTemp?.toInt()}°C',
                        style: const TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        Text(
                          '  ${minTemp?.toInt()}° / ${maxTemp?.toInt()}° ',
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Text(
                '$condition',
                style:
                    const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
