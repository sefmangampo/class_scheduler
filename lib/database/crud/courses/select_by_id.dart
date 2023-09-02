import '../crud_imports.dart';

Future<Course> selectCourseById(int id) async {
  final database = await DatabaseService().database;

  final course = await database.rawQuery(selectCourseByIdSQL(), [id]);
  return Course.fromSqlfliteDatabase(course.first);
}
