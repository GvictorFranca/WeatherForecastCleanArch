import 'package:dartz/dartz.dart';
import 'package:weather_challenge/core/error/exceptions/cache_exception.dart';
import 'package:weather_challenge/core/error/failures/cache_failure.dart';
import 'package:weather_challenge/core/error/failures/failures.dart';
import 'package:weather_challenge/core/error/network/network_info.dart';
import 'package:weather_challenge/features/data/datasource/forecast/forecast_localdatasource.dart';
import 'package:weather_challenge/features/data/datasource/forecast/forecast_remote_datasource.dart';
import 'package:weather_challenge/features/data/mapper/exception/exception_mapper.dart';
import 'package:weather_challenge/features/data/models/forecast/forecast_model.dart';
import 'package:weather_challenge/features/domain/entities/forecast/forecast_entity.dart';
import 'package:weather_challenge/features/domain/repositories/forecast_repository.dart';

typedef Future<Either<Exception, ForecastModel>> _GetForecast();

class ForecastRepositoryImpl implements ForecastRepository {
  final ExceptionMapper exceptionMapper;
  final ForecastRemoteDataSource remoteDataSource;
  final ForecastLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ForecastRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.exceptionMapper,
  });

  @override
  Future<Either<Failure, ForecastEntity>> getForecastByCityName(
      String cityName) async {
    return await _getForecast(() {
      return remoteDataSource.getForecastByCityName(cityName);
    });
  }

  Future<Either<Failure, ForecastEntity>> _getForecast(
    _GetForecast getForecast,
  ) async {
    if (await networkInfo.checkConnection()) {
      final responseResult = await getForecast();
      return responseResult.fold(
        (Exception left) {
          final failure = exceptionMapper.mapExceptionToFailure(left);
          return Left(failure);
        },
        (ForecastModel forecastModel) async {
          await localDataSource.cacheForecast(forecastModel);
          return Right(forecastModel);
        },
      );
    } else {
      try {
        final localWeather = await localDataSource.getLastForecast();
        return Right(localWeather);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
