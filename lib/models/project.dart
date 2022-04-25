import 'package:equatable/equatable.dart';

class Project extends Equatable {
  const Project(this.id, this.userId, this.name);

  final String id;
  final String userId;
  final String name;

  @override
  List<Object?> get props => [id, userId, name];
}
