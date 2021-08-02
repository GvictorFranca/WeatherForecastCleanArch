import 'query_param_mapper.dart';

class QueryParamMapperImpl extends QueryParamMapper {
  @override
  Map<String, dynamic> mapQueryParam(
      {required String token,
      required String cityName,
      required String units,
      int? count}) {
    return {'cnt': count, 'appid': token, 'q': cityName, 'units': units};
  }
}
