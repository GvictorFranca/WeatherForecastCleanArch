import 'package:equatable/equatable.dart';

class SysEntity extends Equatable {
  final String pod;

  @override
  List<Object> get props => [
        pod,
      ];

  SysEntity({
    required this.pod,
  });
}
