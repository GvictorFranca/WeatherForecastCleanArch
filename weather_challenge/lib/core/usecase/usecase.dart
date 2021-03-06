import 'package:dartz/dartz.dart';
import 'package:weather_challenge/core/error/failures/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
