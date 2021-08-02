import 'package:weather_challenge/core/error/failures/failures.dart';

abstract class ExceptionMapper {
  Failure mapExceptionToFailure(Exception exception);
}
