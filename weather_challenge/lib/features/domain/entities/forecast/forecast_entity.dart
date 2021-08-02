import 'package:equatable/equatable.dart';
import 'package:weather_challenge/features/domain/entities/forecast/city_entity.dart';

import 'element_entity.dart';

class ForecastEntity extends Equatable {
  final String cod;
  final int message;
  final int cnt;
  final List<ElementEntity> list;
  final CityEntity city;

  @override
  List<Object> get props => [
        cod,
        message,
        cnt,
        list,
        city,
      ];
  ForecastEntity({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });
}
