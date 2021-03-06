import 'package:dio/dio.dart';
import 'package:weather_challenge/features/data/http/http_client.dart';
import 'package:weather_challenge/features/data/http/http_error.dart';

class HttpAdapter implements HttpClient {
  final Dio client;

  HttpAdapter({
    required this.client,
  });

  @override
  Future request({
    required String url,
    required String method,
    Map<String, dynamic>? queryParams,
    Map? headers,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
          {'content-type': 'application/json', 'accept': 'application/json'});

    var response = Response(
      requestOptions: RequestOptions(
        queryParameters: {},
        baseUrl: '',
        path: '',
      ),
    );

    try {
      switch (method) {
        case 'get':
          response = await client.get(
            url,
            queryParameters: queryParams,
            options: Options(
              headers: defaultHeaders,
            ),
          );
          break;
      }
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 401:
          throw UnauthorizedError();
        case 403:
          throw ForbiddenError();
        case 404:
          throw NotFoundError();
        default:
          throw ServerError();
      }
    }

    return response.data;
  }
}
