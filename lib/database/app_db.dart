import 'package:san_na_ko/database/crud/crud.dart';
import 'package:san_na_ko/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:san_na_ko/database/tables/tables.dart';

class AppDB {
  Future<void> createTable(Database database) async {
    await database.execute(createCoursesTable());
    // await database.execute(createDaysOfWeekTable());
    // await database.execute(createLocationsTable());
    // await database.execute(createProfessorsTable());
    // await database.execute(createSectionsTable());
    // await database.execute(createStudentsTable());
    // await database.execute(createSubjectsTable());
  }

  Future<int> createCourse(
      String name, String fullname, String description) async {
    return insertCourse(name, fullname, description);
  }

  Future<List<Course>> getCourses() async {
    print("selecting $selectAllCourses()");
    return selectAllCourses();
  }

  Future<Course> getCourseById(int id) async {
    return selectCourseById(id);
  }

  Future<int> editCourse(
    int id,
    String? name,
    String? fullname,
    String? description,
    bool? isActive,
  ) async {
    return updateCourse(id, {name, fullname, description, isActive} as Map);
  }

  Future<void> removeCourse(int id) async {
    deleteCourse(id);
  }
}
