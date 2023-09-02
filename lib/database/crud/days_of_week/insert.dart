import '../crud_imports.dart';

Future<int> insertDay(String name, String code) async {
  final database = await DatabaseService().database;

  final currentTime = DateTime.now().millisecondsSinceEpoch;

  return await database.rawInsert(insertDaySQL(), [name, code, currentTime]);
}
