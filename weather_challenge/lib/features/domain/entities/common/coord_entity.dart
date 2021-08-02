import 'package:equatable/equatable.dart';

class CoordEntity extends Equatable {
  final double lon;
  final double lat;

  @override
  List<Object> get props => [
        lon,
        lat,
      ];

  CoordEntity({
    required this.lon,
    required this.lat,
  });
}
