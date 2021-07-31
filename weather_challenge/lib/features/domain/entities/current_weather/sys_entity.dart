import 'package:equatable/equatable.dart';

class SysEntity extends Equatable {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  @override
  List<Object> get props => [
        type,
        id,
        country,
        sunrise,
        sunset,
      ];

  SysEntity({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
}
