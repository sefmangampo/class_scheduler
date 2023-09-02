String createSubjectsTable() {
  return """
        CREATE TABLE IF NOT EXISTS subjects (
          "id"              INTEGER NOT NULL,
          "code"            TEXT NOT NULL,
          "description"     TEXT NOT NULL,
          "units"           INTEGER NOT NULL,
          "professor_id"    INTEGER,
          "location_id"     INTEGER,
          "day_of_week_id"  INTEGER,
          "course_id"       INTEGER NOT NULL,
          "section_id"      INTEGER NOT NULL,
          "is_online"       INTEGER NOT NULL,
          "class_start"     TEXT,  
          "class_end"       TEXT,  
          "is_active"       INTEGER NOT NULL,
          "created_at"      INTEGER NOT NULL DEFAULT (cast(strftime('%s','now) as int))
          "updated_at"      INTEGER,
          PRIMARY KEY("id" AUTOINCREMENT)
        );""";
}

String insertSubjectSQL() {
  return '''INSERT INTO subjects (code, description, units, professor_id, location_id,
   day_of_week_id, course_id, section_id, is_online, class_start, class_end, is_active,
   created_at)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)) ''';
}

String selectAllSubjectsSQL() {
  return 'SELECT * FROM subjects ORDER BY COALESCE(updated_at, created_at)';
}

String selectSubjectByIdSQL() {
  return 'SELECT * FROM subjects WHERE ID = ?';
}

String deleteSubjectByIdSQL() {
  return 'DELETE FROM subjects WHERE ID = ?';
}
