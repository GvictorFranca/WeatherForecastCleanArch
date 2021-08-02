import 'package:weather_challenge/core/error/failures/constants/failures_constants.dart';
import 'package:weather_challenge/core/error/failures/failures.dart';
import 'package:weather_challenge/core/error/failures/not_found_failure.dart';
import 'package:weather_challenge/core/error/failures/server_failure.dart';

mixin MapFailureToMessage {
  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case NotFoundFailure:
        return NOT_FOUND_FAILURE_MESSAGE;
      default:
        return UNEXPECTED_ERROR;
    }
  }
}
