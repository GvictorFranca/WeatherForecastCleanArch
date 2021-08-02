part of 'forecast_bloc.dart';

abstract class ForecastEvent extends Equatable {
  ForecastEvent();
}

class GetForecastEvent extends ForecastEvent {
  final String cityName;

  @override
  List<Object> get props => [cityName];

  GetForecastEvent({
    required this.cityName,
  });
}
