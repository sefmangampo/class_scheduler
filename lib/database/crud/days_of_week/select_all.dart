import '../crud_imports.dart';

Future<List<DayOfWeek>> selectAllDays() async {
  final database = await DatabaseService().database;

  final days = await database.rawQuery(selectAllCoursesSQL());
  return days.map((e) => DayOfWeek.fromSqlfliteDatabase(e)).toList();
}
