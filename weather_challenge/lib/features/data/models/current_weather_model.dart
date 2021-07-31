import 'package:weather_challenge/features/domain/entities/current_weather/current_weather_entity.dart';

import 'clouds_model.dart';
import 'coord_model.dart';
import 'main_model.dart';
import 'sys_model.dart';
import 'weather_model.dart';
import 'wind_model.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  final CoordModel coord;
  final List<WeatherModel> weather;
  final String base;
  final MainModel main;
  final int visibility;
  final WindModel wind;
  final CloudsModel clouds;
  final int dt;
  final SysModel sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  CurrentWeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  }) : super(
          coord: coord,
          weather: weather,
          base: base,
          main: main,
          visibility: visibility,
          wind: wind,
          clouds: clouds,
          dt: dt,
          sys: sys,
          timezone: timezone,
          id: id,
          name: name,
          cod: cod,
        );

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherModel(
        coord: CoordModel.fromJson(json["coord"]),
        weather: List<WeatherModel>.from(
            json["weather"].map((x) => WeatherModel.fromJson(x))),
        base: json["base"],
        main: MainModel.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: WindModel.fromJson(json["wind"]),
        clouds: CloudsModel.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: SysModel.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );
}
