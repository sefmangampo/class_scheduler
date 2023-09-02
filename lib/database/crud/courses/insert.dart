import '../crud_imports.dart';

Future<int> insertCourse(
    String name, String fullname, String description) async {
  final database = await DatabaseService().database;

  final currentTime = DateTime.now().millisecondsSinceEpoch;

  return await database.rawInsert(
      insertCourseSQL(), [name, fullname, description, 1, currentTime]);
}
