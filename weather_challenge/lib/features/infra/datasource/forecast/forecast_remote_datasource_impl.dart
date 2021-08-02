import 'package:dartz/dartz.dart';
import 'package:weather_challenge/features/data/datasource/forecast/forecast_remote_datasource.dart';
import 'package:weather_challenge/features/data/http/http_client.dart';
import 'package:weather_challenge/features/data/models/forecast/forecast_model.dart';
import 'package:weather_challenge/features/infra/mapper/query_parameters/query_param_mapper.dart';

class ForecastRemoteDataSourceImpl implements ForecastRemoteDataSource {
  final String url;
  final String method;
  final String token;
  final String units;
  final int? count;
  final HttpClient httpClient;
  final QueryParamMapper? queryParamMapper;

  ForecastRemoteDataSourceImpl({
    required this.httpClient,
    required this.url,
    required this.token,
    required this.method,
    required this.units,
    this.queryParamMapper,
    this.count,
  });

  @override
  Future<Either<Exception, ForecastModel>> getForecastByCityName(
      String cityName) async {
    try {
      return Right(await _getForecastFromUrl(url, params: cityName));
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<ForecastModel> _getForecastFromUrl(String url,
      {String? params}) async {
    final queryParams = queryParamMapper?.mapQueryParam(
        token: token, cityName: params!, count: count, units: units);

    final response = await httpClient.request(
      method: method,
      url: url,
      queryParams: queryParams,
    );
    final result = ForecastModel.fromJson(response);
    return result;
  }
}
