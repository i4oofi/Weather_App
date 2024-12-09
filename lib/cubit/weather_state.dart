part of 'weather_cubit.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  String cityName;

  WeatherSuccess({required this.cityName});
}

final class WeatherFailure extends WeatherState {}
