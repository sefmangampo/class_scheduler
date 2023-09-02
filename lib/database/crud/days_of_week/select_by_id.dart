import '../crud_imports.dart';

Future<DayOfWeek> selectDayById(int id) async {
  final database = await DatabaseService().database;

  final days = await database.rawQuery(selectDayByIdSQL(), [id]);
  return DayOfWeek.fromSqlfliteDatabase(days.first);
}
