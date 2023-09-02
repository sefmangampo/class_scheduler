import '../crud_imports.dart';

Future<void> deleteCourse(int id) async {
  final database = await DatabaseService().database;
  await database.rawDelete(deleteCourseByIdSQL(), [id]);
}
