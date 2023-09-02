class Section {
  final String name;
  final String? description;
  final int? adviserId;
  final int courseId;
  final int id;
  final bool isActive;
  final String createdAt;
  final String? updatedAt;

  Section(
      {required this.name,
      required this.courseId,
      this.adviserId,
      required this.id,
      this.description,
      required this.isActive,
      required this.createdAt,
      this.updatedAt});

  factory Section.fromSqlfliteDatabase(Map<String, dynamic> map) => Section(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        adviserId: map['adviser_id']?.toInt() ?? 0,
        courseId: map['course_id']?.toInt() ?? 0,
        isActive: map['is_active']?.toInt() == 1 ? true : false,
        createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'])
            .toIso8601String(),
        updatedAt: map['updated_at'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
                .toIso8601String(),
      );
}
