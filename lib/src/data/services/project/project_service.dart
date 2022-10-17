import 'package:wordsus_app/src/data/models/project.dart';

///
abstract class ProjectService {
  ///
  Stream<List<Project>> watchAll();

  ///
  Future<void> add(Project project);

  ///
  Future<void> update(Project project);

  ///
  Future<void> removeById(String id);
}
