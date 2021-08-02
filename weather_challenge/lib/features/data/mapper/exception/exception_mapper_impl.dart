import 'package:weather_challenge/core/error/failures/failures.dart';
import 'package:weather_challenge/core/error/failures/forbidden_failure.dart';
import 'package:weather_challenge/core/error/failures/not_found_failure.dart';
import 'package:weather_challenge/core/error/failures/server_failure.dart';
import 'package:weather_challenge/core/error/failures/unauthorized_failure.dart';
import 'package:weather_challenge/features/data/http/http_error.dart';
import 'package:weather_challenge/features/data/mapper/exception/exception_mapper.dart';

class ExceptionMapperImpl extends ExceptionMapper {
  @override
  Failure mapExceptionToFailure(Exception exception) {
    switch (exception.runtimeType) {
      case NotFoundError:
        return NotFoundFailure();
      case ForbiddenError:
        return ForbiddenFailure();
      case UnauthorizedError:
        return UnauthorizedFailure();
      default:
        return ServerFailure();
    }
  }
}
