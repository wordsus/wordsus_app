import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post(this.id, this.projectId, this.title);

  final String id;
  final String projectId;
  final String title;

  @override
  List<Object?> get props => [id, projectId, title];
}
