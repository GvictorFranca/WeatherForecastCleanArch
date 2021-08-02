import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final dynamic value;

  @override
  List<Object> get props => [value];

  Params({
    required this.value,
  });
}
