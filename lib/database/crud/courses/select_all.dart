import '../crud_imports.dart';

Future<List<Course>> selectAllCourses() async {
  final database = await DatabaseService().database;

  final courses = await database.rawQuery(selectAllCoursesSQL());

  print("heere in felarth acll $courses");
  return courses.map((e) => Course.fromSqlfliteDatabase(e)).toList();
}
