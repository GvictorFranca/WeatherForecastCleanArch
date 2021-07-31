import 'package:dartz/dartz.dart';
import 'package:weather_challenge/core/error/failures/failures.dart';
import 'package:weather_challenge/features/domain/entities/current_weather/current_weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, CurrentWeatherEntity>> getWeatherByCityName({
    required String cityName,
  });
}
