String createDaysOfWeekTable() {
  return """
        CREATE TABLE IF NOT EXISTS days_of_week (
          "id"        INTEGER NOT NULL,
          "code"      TEXT NOT NULL,
          "name"      TEXT NOT NULL, 
          "created_at" INTEGER NOT NULL DEFAULT (cast(strftime('%s','now) as int))
          "updated_at" INTEGER,
          PRIMARY KEY("id" AUTOINCREMENT)
        );""";
}

String insertDaySQL() {
  return '''INSERT INTO days_of_week (code, name, created_at)
        VALUES (?, ?, ?)) ''';
}

String selectAllDaysSQL() {
  return 'SELECT * FROM days_of_week ORDER BY COALESCE(updated_at, created_at)';
}

String selectDayByIdSQL() {
  return 'SELECT * FROM days_of_week WHERE ID = ?';
}

String deleteDayByIdSQL() {
  return 'DELETE FROM days_of_week WHERE ID = ?';
}
