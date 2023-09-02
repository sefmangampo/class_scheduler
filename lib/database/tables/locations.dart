String createLocationsTable() {
  return """
        CREATE TABLE IF NOT EXISTS locations (
          "id"        INTEGER NOT NULL,
          "description"      TEXT NOT NULL,
          "name"      TEXT NOT NULL, 
          "is_virtual" INTEGER NOT NULL,
          "is_active" INTEGER NOT NULL,
          "created_at" INTEGER NOT NULL DEFAULT (cast(strftime('%s','now) as int))
          "updated_at" INTEGER,
          PRIMARY KEY("id" AUTOINCREMENT)
        );""";
}

String insertLocationSQL() {
  return '''INSERT INTO locations (name, description, is_virtual, is_active, created_at)
        VALUES (?, ?, ?, ? ,? )) ''';
}

String selectAllLocationsSQL() {
  return 'SELECT * FROM locations ORDER BY COALESCE(updated_at, created_at)';
}

String selectLocationByIdSQL() {
  return 'SELECT * FROM locations WHERE ID = ?';
}

String deleteLocationByIdSQL() {
  return 'DELETE FROM locations WHERE ID = ?';
}
