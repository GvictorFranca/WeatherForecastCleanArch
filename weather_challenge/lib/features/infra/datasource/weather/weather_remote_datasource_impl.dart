import 'package:dartz/dartz.dart';
import 'package:weather_challenge/features/data/datasource/weather/weather_remote_datasource.dart';
import 'package:weather_challenge/features/data/http/http_client.dart';
import 'package:weather_challenge/features/data/models/weather/current_weather_model.dart';
import 'package:weather_challenge/features/infra/mapper/query_parameters/query_param_mapper.dart';

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final String url;
  final String method;
  final String token;
  final String units;
  final HttpClient httpClient;
  final QueryParamMapper? queryParamMapper;

  WeatherRemoteDataSourceImpl({
    required this.httpClient,
    required this.url,
    required this.token,
    required this.method,
    required this.units,
    this.queryParamMapper,
  });

  @override
  Future<Either<Exception, CurrentWeatherModel>> getWeatherByCityName(
      String cityName) async {
    try {
      return Right(await _getWeatherFromUrl(url, params: cityName));
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<CurrentWeatherModel> _getWeatherFromUrl(String url,
      {String? params}) async {
    final queryParams = queryParamMapper?.mapQueryParam(
      token: token,
      cityName: params!,
      units: units,
    );

    final response = await httpClient.request(
      method: method,
      url: url,
      queryParams: queryParams,
    );
    final result = CurrentWeatherModel.fromJson(response);
    return result;
  }
}
