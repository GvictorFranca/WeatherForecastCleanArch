import 'package:weather_challenge/features/domain/entities/current_weather/coord_entity.dart';

class CoordModel extends CoordEntity {
  final double lon;
  final double lat;

  CoordModel({
    required this.lon,
    required this.lat,
  }) : super(
          lat: lat,
          lon: lon,
        );

  factory CoordModel.fromJson(Map<String, dynamic> json) => CoordModel(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );
}
