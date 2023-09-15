class Course {
  final int id;
  final String name;
  final String? fullname;
  final String? description;

  final bool isActive;
  final String createdAt;
  final String? updatedAt;

  Course(
      {required this.id,
      required this.name,
      required this.fullname,
      this.description,
      required this.isActive,
      required this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'fullname': fullname,
      'descripton': description,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  factory Course.fromSqlfliteDatabase(Map<String, dynamic> map) => Course(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? '',
        fullname: map['fullname'] ?? '',
        isActive: map['is_active'].toInt() == 1 ? true : false,
        createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'])
            .toIso8601String(),
        updatedAt: map['updated_at'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
                .toIso8601String(),
      );
}
