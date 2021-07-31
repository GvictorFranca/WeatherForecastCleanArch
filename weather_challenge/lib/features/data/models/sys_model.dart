import 'package:weather_challenge/features/domain/entities/current_weather/sys_entity.dart';

class SysModel extends SysEntity {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  SysModel({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  }) : super(
          type: type,
          id: id,
          country: country,
          sunrise: sunrise,
          sunset: sunset,
        );

  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
        type: json["type"],
        id: json["id"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );
  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}
