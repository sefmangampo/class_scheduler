import '../crud_imports.dart';

Future<void> deleteDay(int id) async {
  final database = await DatabaseService().database;
  await database.rawDelete(deleteDayByIdSQL(), [id]);
}
