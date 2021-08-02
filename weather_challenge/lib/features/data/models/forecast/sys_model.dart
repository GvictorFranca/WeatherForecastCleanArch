import 'package:weather_challenge/features/domain/entities/forecast/sys_entity.dart';

class SysModel extends SysEntity {
  final String pod;

  SysModel({
    required this.pod,
  }) : super(
          pod: pod,
        );

  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
        pod: json["pod"],
      );

  Map<String, dynamic> toJson() => {
        "pod": pod,
      };
}
