import 'package:weather_challenge/features/domain/entities/current_weather/clouds_entity.dart';

class CloudsModel extends CloudsEntity {
  final int all;

  CloudsModel({
    required this.all,
  }) : super(
          all: all,
        );

  factory CloudsModel.fromJson(Map<String, dynamic> json) => CloudsModel(
        all: json["all"],
      );
}
