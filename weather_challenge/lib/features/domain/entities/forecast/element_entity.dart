import 'package:equatable/equatable.dart';
import 'package:weather_challenge/features/domain/entities/common/clouds_entity.dart';

import 'package:weather_challenge/features/domain/entities/forecast/main_entity.dart';
import 'package:weather_challenge/features/domain/entities/forecast/sys_entity.dart';
import 'package:weather_challenge/features/domain/entities/forecast/wind_entity.dart';
import 'package:weather_challenge/features/domain/entities/common/weather_entity.dart';

class ElementEntity extends Equatable {
  final int dt;
  final MainEntity main;
  final List<WeatherEntity> weather;
  final CloudsEntity clouds;
  final WindEntity wind;
  final int visibility;

  final SysEntity sys;
  final String dtTxt;

  @override
  List<Object> get props => [
        dt,
        main,
        weather,
        clouds,
        wind,
        visibility,
        sys,
        dtTxt,
      ];

  ElementEntity({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.sys,
    required this.dtTxt,
  });
}
