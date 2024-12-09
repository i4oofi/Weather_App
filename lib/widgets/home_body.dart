import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/views/failure_page.dart';
import 'package:weather/views/initial_page2.dart';
import 'package:weather/widgets/success_body.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return Stack(
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
              const Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 51, 66, 73),
              )),
            ],
          );
        } else if (state is WeatherSuccess) {
          return const SuccessBody();
        } else if (state is WeatherFailure) {
          return const FailureBody();
        } else {
          return const InitialPage2();
        }
      },
    );
  }
}
