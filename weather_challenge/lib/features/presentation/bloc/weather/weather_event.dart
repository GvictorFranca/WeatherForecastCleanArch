part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  WeatherEvent();
}

class GetCurrentWeatherEvent extends WeatherEvent {
  final String cityName;

  @override
  List<Object> get props => [cityName];

  GetCurrentWeatherEvent({
    required this.cityName,
  });
}
