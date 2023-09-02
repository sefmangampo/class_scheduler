String createProfessorsTable() {
  return """
        CREATE TABLE IF NOT EXISTS professors (
          "id"        INTEGER NOT NULL,
          "firstname"      TEXT NOT NULL,
          "lastname"      TEXT NOT NULL, 
          "is_male" INTEGER NOT NULL,
          "is_active" INTEGER NOT NULL,
          "created_at" INTEGER NOT NULL DEFAULT (cast(strftime('%s','now) as int))
          "updated_at" INTEGER,
          PRIMARY KEY("id" AUTOINCREMENT)
        );""";
}

String insertProfessorSQL() {
  return '''INSERT INTO professors (firstname, lastname, is_male, is_active, created_at)
        VALUES (?, ?, ?, ?, ?)) ''';
}

String selectAllProfessorsSQL() {
  return 'SELECT * FROM professors ORDER BY COALESCE(updated_at, created_at)';
}

String selectProfessorByIdSQL() {
  return 'SELECT * FROM professors WHERE ID = ?';
}

String deleteProfessorByIdSQL() {
  return 'DELETE FROM professors WHERE ID = ?';
}
