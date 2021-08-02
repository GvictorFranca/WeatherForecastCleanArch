import 'package:dartz/dartz.dart';
import 'package:weather_challenge/features/data/models/weather/current_weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<Either<Exception, CurrentWeatherModel>> getWeatherByCityName(
      String cityName);
}
