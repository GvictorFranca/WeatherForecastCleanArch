import 'package:weather_challenge/features/data/models/common/coord_model.dart';
import 'package:weather_challenge/features/domain/entities/forecast/city_entity.dart';

class CityModel extends CityEntity {
  final int id;
  final String name;
  final CoordModel coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  CityModel({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  }) : super(
          id: id,
          name: name,
          coord: coord,
          country: country,
          population: population,
          timezone: timezone,
          sunrise: sunrise,
          sunset: sunset,
        );

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        name: json["name"],
        coord: CoordModel.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}
