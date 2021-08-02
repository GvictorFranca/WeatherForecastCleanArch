import 'dart:convert';

import 'package:weather_challenge/core/error/exceptions/cache_exception.dart';
import 'package:weather_challenge/features/data/cache/cache_storage.dart';
import 'package:weather_challenge/features/data/datasource/weather/weather_local_datasource.dart';
import 'package:weather_challenge/features/data/models/weather/current_weather_model.dart';

const CACHED_WEATHER = 'CACHED_WEATHER';

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final CacheStorage cacheStorage;

  WeatherLocalDataSourceImpl({required this.cacheStorage});

  @override
  Future<CurrentWeatherModel> getLastWeather() async {
    final jsonString = await cacheStorage.fetch(CACHED_WEATHER);
    if (jsonString != null) {
      return CurrentWeatherModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCurrentWeather(CurrentWeatherModel currentWeatherModel) {
    return cacheStorage.save(
      key: CACHED_WEATHER,
      value: json.encode(currentWeatherModel.toJson()),
    );
  }
}
