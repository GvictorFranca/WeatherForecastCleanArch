import 'dart:convert';

import 'package:weather_challenge/core/error/exceptions/cache_exception.dart';
import 'package:weather_challenge/features/data/cache/cache_storage.dart';
import 'package:weather_challenge/features/data/datasource/forecast/forecast_localdatasource.dart';
import 'package:weather_challenge/features/data/models/forecast/forecast_model.dart';
import 'package:weather_challenge/features/domain/entities/forecast/forecast_entity.dart';

const CACHED_FORECAST = 'CACHED_FORECAST';

class ForecastLocalDataSourceImpl implements ForecastLocalDataSource {
  final CacheStorage cacheStorage;

  ForecastLocalDataSourceImpl({required this.cacheStorage});

  @override
  Future<void> cacheForecast(ForecastModel forecastModel) {
    return cacheStorage.save(
      key: CACHED_FORECAST,
      value: json.encode(forecastModel.toJson()),
    );
  }

  @override
  Future<ForecastEntity> getLastForecast() async {
    final jsonString = await cacheStorage.fetch(CACHED_FORECAST);
    if (jsonString != null) {
      return ForecastModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }
}
