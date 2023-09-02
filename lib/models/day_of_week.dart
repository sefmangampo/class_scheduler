class DayOfWeek {
  final String name;
  final String code;
  final int id;
  final String createdAt;
  final String? updatedAt;

  DayOfWeek(
      {required this.name,
      required this.code,
      required this.id,
      required this.createdAt,
      this.updatedAt});

  factory DayOfWeek.fromSqlfliteDatabase(Map<String, dynamic> map) => DayOfWeek(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? '',
        code: map['code'] ?? '',
        createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'])
            .toIso8601String(),
        updatedAt: map['updated_at'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
                .toIso8601String(),
      );
}
