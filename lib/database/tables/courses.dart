String createCoursesTable() {
  return """
        CREATE TABLE IF NOT EXISTS courses (
          "id"        INTEGER NOT NULL,
          "name"      TEXT NOT NULL,
          "fullname"  TEXT,
          "description" TEXT,
          "is_active" INTEGER,
          "created_at" INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP,
          "updated_at" INTEGER,
          PRIMARY KEY("id" AUTOINCREMENT)
        );""";
}

String insertCourseSQL() {
  return '''INSERT INTO courses (name, fullname, description, is_active, created_at)
        VALUES (?, ?, ?, ?, ?)) ''';
}

String selectAllCoursesSQL() {
  return 'SELECT * FROM courses ORDER BY COALESCE(updated_at, created_at)';
}

String selectCourseByIdSQL() {
  return 'SELECT * FROM courses WHERE ID = ?';
}

String deleteCourseByIdSQL() {
  return 'DELETE FROM course WHERE ID = ?';
}
