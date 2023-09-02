import '../crud_imports.dart';

Future<void> deleteLocation(int id) async {
  final database = await DatabaseService().database;
  await database.rawDelete(deleteLocationByIdSQL(), [id]);
}
