import 'package:dartz/dartz.dart';
import 'package:weather_challenge/core/error/failures/failures.dart';
import 'package:weather_challenge/core/usecase/usecase.dart';
import 'package:weather_challenge/core/utils/params.dart';
import 'package:weather_challenge/features/domain/entities/forecast/forecast_entity.dart';
import 'package:weather_challenge/features/domain/repositories/forecast_repository.dart';

class GetForecast implements UseCase<ForecastEntity, Params> {
  final ForecastRepository repository;

  const GetForecast({required this.repository});

  @override
  Future<Either<Failure, ForecastEntity>> call(Params params) async {
    return await repository.getForecastByCityName(params.value);
  }
}
