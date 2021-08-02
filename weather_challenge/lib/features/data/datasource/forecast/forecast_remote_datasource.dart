import 'package:dartz/dartz.dart';
import 'package:weather_challenge/features/data/models/forecast/forecast_model.dart';

abstract class ForecastRemoteDataSource {
  Future<Either<Exception, ForecastModel>> getForecastByCityName(
      String cityName);
}
