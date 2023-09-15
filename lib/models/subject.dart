class Subject {
  final String code;
  final String name;
  final String? description;
  final int units;
  final bool isOnline;
  final bool isActive;
  final int id;
  final String createdAt;
  final String? updatedAt;

  Subject(
      {required this.code,
      required this.id,
      required this.name,
      this.description,
      required this.units,
      required this.isActive,
      required this.isOnline,
      required this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'description': description,
      'units': units,
      'isOnline': isOnline,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  factory Subject.fromSqlfliteDatabase(Map<String, dynamic> map) => Subject(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? '',
        code: map['code'] ?? '',
        description: map['description'] ?? '',
        units: map['units']?.toInt() ?? 0,
        isOnline: map['is_online']?.toInt() == 1 ? true : false,
        isActive: map['is_active']?.toInt() == 1 ? true : false,
        createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'])
            .toIso8601String(),
        updatedAt: map['updated_at'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
                .toIso8601String(),
      );
}
