import 'package:dartz/dartz.dart';
import 'package:weather_challenge/core/error/exceptions/cache_exception.dart';
import 'package:weather_challenge/core/error/failures/cache_failure.dart';
import 'package:weather_challenge/core/error/failures/failures.dart';

import 'package:weather_challenge/core/network/network_info.dart';
import 'package:weather_challenge/features/data/datasource/weather/weather_local_datasource.dart';
import 'package:weather_challenge/features/data/datasource/weather/weather_remote_datasource.dart';
import 'package:weather_challenge/features/data/mapper/exception/exception_mapper.dart';
import 'package:weather_challenge/features/data/models/weather/current_weather_model.dart';
import 'package:weather_challenge/features/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_challenge/features/domain/repositories/weather_repository.dart';

typedef Future<Either<Exception, CurrentWeatherModel>> _GetCurrentWeather();

class WeatherRepositoryImpl implements WeatherRepository {
  final ExceptionMapper exceptionMapper;
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.exceptionMapper,
  });

  @override
  Future<Either<Failure, CurrentWeatherEntity>> getWeatherByCityName(
      String cityName) async {
    return await _getWeather(() {
      return remoteDataSource.getWeatherByCityName(cityName);
    });
  }

  Future<Either<Failure, CurrentWeatherEntity>> _getWeather(
    _GetCurrentWeather getCurrentWeather,
  ) async {
    if (await networkInfo.checkConnection()) {
      final responseResult = await getCurrentWeather();
      return responseResult.fold(
        (Exception left) {
          final failure = exceptionMapper.mapExceptionToFailure(left);
          return Left(failure);
        },
        (CurrentWeatherModel currentWeatherModel) async {
          await localDataSource.cacheCurrentWeather(currentWeatherModel);
          return Right(currentWeatherModel);
        },
      );
    } else {
      try {
        final localWeather = await localDataSource.getLastWeather();
        return Right(localWeather);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
