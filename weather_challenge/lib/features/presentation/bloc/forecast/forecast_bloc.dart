import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_challenge/core/error/failures/failures.dart';
import 'package:weather_challenge/core/utils/params.dart';
import 'package:weather_challenge/features/domain/entities/forecast/forecast_entity.dart';
import 'package:weather_challenge/features/domain/usecases/get_forecast.dart';
import 'package:weather_challenge/features/presentation/mixins/map_failure_to_message.dart';

import 'forecast_state.dart';

part 'forecast_event.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState>
    with MapFailureToMessage {
  final GetForecast _getForecast;

  ForecastBloc({
    required GetForecast getForecast,
  })  : _getForecast = getForecast,
        super(Initial());

  @override
  Stream<ForecastState> mapEventToState(
    ForecastEvent event,
  ) async* {
    if (event is GetForecastEvent) {
      yield ForecastLoading();
      final failureOrResult =
          await _getForecast.call(Params(value: event.cityName));
      yield* _eitherLoadedForecastState(failureOrResult);
    }
  }

  Stream<ForecastState> _eitherLoadedForecastState(
    Either<Failure, ForecastEntity> failureOrResult,
  ) async* {
    yield failureOrResult.fold(
      (left) => ForecastError(message: mapFailureToMessage(left)),
      (right) => ForecastLoaded(forecastEntity: right),
    );
  }
}
