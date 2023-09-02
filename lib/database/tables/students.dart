String createStudentsTable() {
  return """
        CREATE TABLE IF NOT EXISTS students (
          "id"        INTEGER NOT NULL,
          "firstname"      TEXT NOT NULL,
          "middlename"      TEXT,
          "lastname"      TEXT NOT NULL,
          "id_number"      TEXT NOT NULL,
          "course_id" INTEGER NOT NULL,
          "section_id" INTEGER NOT NULL,
          "is_male" INTEGER NOT NULL,  
          "is_active" INTEGER NOT NULL,
          "created_at" INTEGER NOT NULL DEFAULT (cast(strftime('%s','now) as int))
          "updated_at" INTEGER,
          PRIMARY KEY("id" AUTOINCREMENT)
        );""";
}

String insertStudentSQL() {
  return '''INSERT INTO students (firstname, middlename, lastname, id_number, course_id, section_id, is_male, is_active, created_at)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)) ''';
}

String selectAllStudentsSQL() {
  return 'SELECT * FROM students ORDER BY COALESCE(updated_at, created_at)';
}

String selectStudentByIdSQL() {
  return 'SELECT * FROM students WHERE ID = ?';
}

String deleteStudentByIdSQL() {
  return 'DELETE FROM students WHERE ID = ?';
}
