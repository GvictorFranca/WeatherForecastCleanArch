part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {}

class Initial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherError extends WeatherState {
  final String message;

  @override
  List<Object> get props => [message];

  WeatherError({required this.message});
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class CurrentWeatherLoaded extends WeatherState {
  final CurrentWeatherEntity currentWeatherEntity;

  @override
  List<Object> get props => [currentWeatherEntity];

  CurrentWeatherLoaded({
    required this.currentWeatherEntity,
  });
}
