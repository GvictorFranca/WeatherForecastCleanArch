import 'package:equatable/equatable.dart';
import 'package:weather_challenge/features/domain/entities/forecast/forecast_entity.dart';

abstract class ForecastState extends Equatable {}

class Initial extends ForecastState {
  @override
  List<Object> get props => [];
}

class ForecastError extends ForecastState {
  final String message;

  @override
  List<Object> get props => [message];

  ForecastError({required this.message});
}

class ForecastLoading extends ForecastState {
  @override
  List<Object> get props => [];
}

class ForecastLoaded extends ForecastState {
  final ForecastEntity forecastEntity;

  @override
  List<Object> get props => [forecastEntity];

  ForecastLoaded({
    required this.forecastEntity,
  });
}
