import 'package:weather_challenge/features/domain/entities/current_weather/wind_entity.dart';

class WindModel extends WindEntity {
  final double speed;
  final int deg;

  WindModel({
    required this.speed,
    required this.deg,
  }) : super(
          speed: speed,
          deg: deg,
        );

  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };
}
