import 'package:weather_challenge/features/data/models/forecast/forecast_model.dart';
import 'package:weather_challenge/features/domain/entities/forecast/forecast_entity.dart';

abstract class ForecastLocalDataSource {
  Future<void> cacheForecast(ForecastModel forecastModel);
  Future<ForecastEntity> getLastForecast();
}
