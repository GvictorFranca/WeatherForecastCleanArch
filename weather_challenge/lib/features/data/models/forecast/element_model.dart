import 'package:weather_challenge/features/data/models/common/clouds_model.dart';
import 'package:weather_challenge/features/data/models/forecast/main_model.dart';
import 'package:weather_challenge/features/data/models/forecast/sys_model.dart';
import 'package:weather_challenge/features/data/models/forecast/wind_model.dart';
import 'package:weather_challenge/features/data/models/common/weather_model.dart';
import 'package:weather_challenge/features/domain/entities/forecast/element_entity.dart';

class ElementModel extends ElementEntity {
  final int dt;
  final MainModel main;
  final List<WeatherModel> weather;
  final CloudsModel clouds;
  final WindModel wind;
  final int visibility;

  final SysModel sys;
  final String dtTxt;

  ElementModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.sys,
    required this.dtTxt,
  }) : super(
          dt: dt,
          main: main,
          weather: weather,
          clouds: clouds,
          wind: wind,
          visibility: visibility,
          sys: sys,
          dtTxt: dtTxt,
        );

  factory ElementModel.fromJson(Map<String, dynamic> json) => ElementModel(
        dt: json["dt"],
        main: MainModel.fromJson(json["main"]),
        weather: List<WeatherModel>.from(
            json["weather"].map((x) => WeatherModel.fromJson(x))),
        clouds: CloudsModel.fromJson(json["clouds"]),
        wind: WindModel.fromJson(json["wind"]),
        visibility: json["visibility"],
        sys: SysModel.fromJson(json["sys"]),
        dtTxt: json["dt_txt"],
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds.toJson(),
        "wind": wind.toJson(),
        "visibility": visibility,
        "sys": sys.toJson(),
      };
}
