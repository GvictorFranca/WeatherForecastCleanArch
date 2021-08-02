import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_challenge/core/error/network/network_info_impl.dart';

import 'package:weather_challenge/features/data/datasource/forecast/forecast_localdatasource.dart';
import 'package:weather_challenge/features/data/mapper/exception/exception_mapper.dart';
import 'package:weather_challenge/features/data/mapper/exception/exception_mapper_impl.dart';
import 'package:weather_challenge/features/data/repositories/forecast_repository_impl.dart';
import 'package:weather_challenge/features/domain/repositories/forecast_repository.dart';
import 'package:weather_challenge/features/domain/usecases/get_forecast.dart';
import 'package:weather_challenge/features/infra/mapper/query_parameters/query_param_mapper.dart';
import 'package:weather_challenge/features/infra/mapper/query_parameters/query_parameters_mapper_impl.dart';

import 'core/error/network/network_info.dart';

import 'core/utils/api_key.dart';
import 'features/data/cache/cache_storage.dart';
import 'features/data/datasource/forecast/forecast_remote_datasource.dart';
import 'features/data/datasource/weather/weather_local_datasource.dart';
import 'features/data/datasource/weather/weather_remote_datasource.dart';
import 'features/data/http/http_client.dart';
import 'features/data/repositories/weather_repository_impl.dart';
import 'features/domain/repositories/weather_repository.dart';
import 'features/domain/usecases/get_current_weather.dart';
import 'features/infra/cache/cache_adapter.dart';
import 'features/infra/datasource/forecast/forecast_local_datasource_impl.dart';
import 'features/infra/datasource/forecast/forecast_remote_datasource_impl.dart';
import 'features/infra/datasource/weather/weather_local_datasource_impl.dart';
import 'features/infra/datasource/weather/weather_remote_datasource_impl.dart';
import 'features/infra/http/http_adapter.dart';
import 'features/presentation/bloc/forecast/forecast_bloc.dart';
import 'features/presentation/bloc/weather/weather_bloc.dart';
import 'features/shared/constants/crud_methods.dart';
import 'features/shared/constants/units_constants.dart';
import 'features/shared/constants/url.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => WeatherBloc(
        getCurrentWeather: sl(),
      ));

  sl.registerFactory(() => ForecastBloc(
        getForecast: sl(),
      ));

  // Usecases
  sl.registerFactory(() => GetCurrentWeather(repository: sl()));
  sl.registerFactory(() => GetForecast(repository: sl()));

  // Repository
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: sl<WeatherRemoteDataSource>(),
      localDataSource: sl<WeatherLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
      exceptionMapper: sl<ExceptionMapper>(),
    ),
  );

  sl.registerLazySingleton<ForecastRepository>(
    () => ForecastRepositoryImpl(
      networkInfo: sl<NetworkInfo>(),
      exceptionMapper: sl<ExceptionMapper>(),
      localDataSource: sl<ForecastLocalDataSource>(),
      remoteDataSource: sl<ForecastRemoteDataSource>(),
    ),
  );

  // Datasource

  sl.registerLazySingleton<WeatherLocalDataSource>(
    () => WeatherLocalDataSourceImpl(cacheStorage: sl()),
  );

  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      httpClient: sl(),
      method: GET,
      url: GET_CURRENT_WEATHER_URL,
      token: API_KEY,
      units: UNIT_METRIC,
      queryParamMapper: sl(),
    ),
  );

  sl.registerLazySingleton<ForecastLocalDataSource>(
    () => ForecastLocalDataSourceImpl(cacheStorage: sl()),
  );

  sl.registerLazySingleton<ForecastRemoteDataSource>(
    () => ForecastRemoteDataSourceImpl(
      httpClient: sl(),
      method: GET,
      url: GET_FORECAST,
      token: API_KEY,
      units: UNIT_METRIC,
      queryParamMapper: sl(),
    ),
  );

  // infra
  sl.registerLazySingleton<HttpClient>(
    () => HttpAdapter(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<CacheStorage>(
    () => CacheAdapter(
      sharedPreferences: sl(),
    ),
  );

  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ExceptionMapper>(() => ExceptionMapperImpl());
  sl.registerLazySingleton<QueryParamMapper>(() => QueryParamMapperImpl());
}
