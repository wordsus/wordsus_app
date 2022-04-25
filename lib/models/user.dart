import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id, this.name, this.theme);

  final String id;
  final String name;
  final String theme;

  @override
  List<Object?> get props => [id, name, theme];
}
