import 'package:weather_challenge/features/data/models/weather/current_weather_model.dart';

abstract class WeatherLocalDataSource {
  Future<CurrentWeatherModel> getLastWeather();

  Future<void> cacheCurrentWeather(CurrentWeatherModel currentWeatherModel);
}
