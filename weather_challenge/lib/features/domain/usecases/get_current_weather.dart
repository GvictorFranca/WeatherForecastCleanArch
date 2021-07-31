import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_challenge/core/error/failures/failures.dart';
import 'package:weather_challenge/core/usecase/usecase.dart';
import 'package:weather_challenge/features/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_challenge/features/domain/repositories/weather_repository.dart';

class GetCurrentWeather implements UseCase<CurrentWeatherEntity, Params> {
  final WeatherRepository repository;

  const GetCurrentWeather(this.repository);

  @override
  Future<Either<Failure, CurrentWeatherEntity>> call(Params params) async {
    return await repository.getWeatherByCityName(cityName: params.cityName);
  }
}

class Params extends Equatable {
  final String cityName;

  @override
  List<Object> get props => [cityName];

  Params({
    required this.cityName,
  });
}
