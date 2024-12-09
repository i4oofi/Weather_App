import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/views/home_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherCubit(),
    child: const Weather(),
  ));
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        var getColor =
            BlocProvider.of<WeatherCubit>(context).weatherModel?.getColor();
        return MaterialApp(
          theme: ThemeData(
              textTheme: GoogleFonts.interTextTheme(),
              appBarTheme:
                  AppBarTheme(backgroundColor: getColor ?? Colors.white)),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}
