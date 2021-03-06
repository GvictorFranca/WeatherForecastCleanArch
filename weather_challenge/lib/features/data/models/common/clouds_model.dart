import 'package:weather_challenge/features/domain/entities/common/clouds_entity.dart';

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

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}
