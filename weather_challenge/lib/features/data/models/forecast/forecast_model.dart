import 'package:weather_challenge/features/domain/entities/forecast/forecast_entity.dart';

import 'city_model.dart';
import 'element_model.dart';

class ForecastModel extends ForecastEntity {
  final String cod;
  final int message;
  final int cnt;
  final List<ElementModel> list;
  final CityModel city;

  ForecastModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  }) : super(
          cod: cod,
          message: message,
          cnt: cnt,
          list: list,
          city: city,
        );

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<ElementModel>.from(
            json["list"].map((x) => ElementModel.fromJson(x))),
        city: CityModel.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "city": city.toJson(),
      };
}
