import 'package:bloc/bloc.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/get_weather.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  WeatherService weatherService = WeatherService();
  WeatherModel? weatherModel;
  String? cityName;
  List<String> citySuggestions = [];

  void weatherManage(cityName) async {
    emit(WeatherLoading());
    try {
      this.cityName = cityName;
      weatherModel = await weatherService.getWeather(cityName: cityName!);
      emit(WeatherSuccess(cityName: cityName!));
    } on Exception {
      emit(WeatherFailure());
    }
  }
}
