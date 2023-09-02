String createSectionsTable() {
  return """
        CREATE TABLE IF NOT EXISTS sections (
          "id"        INTEGER NOT NULL,
          "name"      TEXT NOT NULL,
          "description"      TEXT,
          "course_id" INTEGER NOT NULL, 
          "is_active" INTEGER NOT NULL,
          "created_at" INTEGER NOT NULL DEFAULT (cast(strftime('%s','now) as int))
          "updated_at" INTEGER,
          PRIMARY KEY("id" AUTOINCREMENT)
        );""";
}

String insertSectionSQL() {
  return '''INSERT INTO sections (name, description, course_id, is_active, created_at)
        VALUES (?, ?, ?, ?, ?)) ''';
}

String selectAllSectionsSQL() {
  return 'SELECT * FROM sections ORDER BY COALESCE(updated_at, created_at)';
}

String selectSectionByIdSQL() {
  return 'SELECT * FROM sections WHERE ID = ?';
}

String deleteSectionByIdSQL() {
  return 'DELETE FROM sections WHERE ID = ?';
}
