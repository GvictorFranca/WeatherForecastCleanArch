import 'package:dartz/dartz.dart';
import 'package:weather_challenge/core/error/failures/failures.dart';
import 'package:weather_challenge/features/domain/entities/forecast/forecast_entity.dart';

abstract class ForecastRepository {
  Future<Either<Failure, ForecastEntity>> getForecastByCityName(
    String cityName,
  );
}
