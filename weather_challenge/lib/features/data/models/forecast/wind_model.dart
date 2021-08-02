import 'package:weather_challenge/features/domain/entities/forecast/wind_entity.dart';

class WindModel extends WindEntity {
  final double speed;
  final int deg;
  final double gust;

  WindModel({
    required this.speed,
    required this.deg,
    required this.gust,
  }) : super(
          deg: deg,
          speed: speed,
          gust: gust,
        );

  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
