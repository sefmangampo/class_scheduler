class Location {
  final int id;
  final String name;
  final String? description;
  final bool isVirtual;
  final bool isActive;
  final String createdAt;
  final String? updatedAt;

  Location(
      {required this.name,
      required this.id,
      this.description,
      required this.isVirtual,
      required this.isActive,
      required this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isVirtual': isVirtual,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  factory Location.fromSqlfliteDatabase(Map<String, dynamic> map) => Location(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        isVirtual: map['is_virtual']?.toInt() == 1 ? true : false,
        isActive: map['is_active']?.toInt() == 1 ? true : false,
        createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'])
            .toIso8601String(),
        updatedAt: map['updated_at'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
                .toIso8601String(),
      );
}
