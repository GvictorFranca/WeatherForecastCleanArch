import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_challenge/core/error/failures/failures.dart';
import 'package:weather_challenge/core/utils/params.dart';
import 'package:weather_challenge/features/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_challenge/features/domain/usecases/get_current_weather.dart';
import 'package:weather_challenge/features/presentation/mixins/map_failure_to_message.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>
    with MapFailureToMessage {
  final GetCurrentWeather _getCurrentWeather;

  WeatherBloc({
    required GetCurrentWeather getCurrentWeather,
  })  : _getCurrentWeather = getCurrentWeather,
        super(Initial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetCurrentWeatherEvent) {
      yield WeatherLoading();
      final failureOrResult =
          await _getCurrentWeather.call(Params(value: event.cityName));
      yield* _eitherLoadedCurrentWeatherState(failureOrResult);
    }
  }

  Stream<WeatherState> _eitherLoadedCurrentWeatherState(
    Either<Failure, CurrentWeatherEntity> failureOrResult,
  ) async* {
    yield failureOrResult.fold(
      (left) => WeatherError(message: mapFailureToMessage(left)),
      (right) => CurrentWeatherLoaded(currentWeatherEntity: right),
    );
  }
}
