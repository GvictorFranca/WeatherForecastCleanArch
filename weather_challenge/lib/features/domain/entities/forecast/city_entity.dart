import 'package:equatable/equatable.dart';
import 'package:weather_challenge/features/domain/entities/common/coord_entity.dart';

class CityEntity extends Equatable {
  final int id;
  final String name;
  final CoordEntity coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  @override
  List<Object> get props => [
        id,
        name,
        coord,
        country,
        population,
        timezone,
        sunrise,
        sunset,
      ];

  CityEntity({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });
}
