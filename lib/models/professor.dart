class Professor {
  final String firstname;
  final String lastname;
  final bool isMale;
  final int id;
  final bool isActive;
  final String createdAt;
  final String? updatedAt;

  Professor(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.isMale,
      required this.createdAt,
      required this.isActive,
      this.updatedAt});

  factory Professor.fromSqlfliteDatabase(Map<String, dynamic> map) => Professor(
        id: map['id']?.toInt() ?? 0,
        firstname: map['firstname'] ?? '',
        lastname: map['lastname'] ?? '',
        isMale: map['is_male']?.toInt() == 1 ? true : false,
        isActive: map['is_active']?.toInt() == 1 ? true : false,
        createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'])
            .toIso8601String(),
        updatedAt: map['updated_at'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
                .toIso8601String(),
      );
}
