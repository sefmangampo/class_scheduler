import 'package:sqflite/sqflite.dart';
import '../crud_imports.dart';

Future<int> updateCourse(int id, Map obj,
    {String? name,
    String? fullname,
    String? description,
    bool? isActive}) async {
  final database = await DatabaseService().database;
  final currentTime = DateTime.now().millisecondsSinceEpoch;

  return await database.update(
      'courses',
      {
        if (name != null) 'name': name,
        if (fullname != null) 'fullname': fullname,
        if (description != null) 'description': description,
        if (isActive != null) 'is_active': isActive,
        'updated_at': currentTime,
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id]);
}
