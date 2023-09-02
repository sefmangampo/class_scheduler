class Subject {
  final String code;
  final String name;
  final String? description;
  final int units;
  final int? professorId;
  final int? locationId;
  final int? dayOfWeekId;
  final String? classStart;
  final String? classEnd;
  final int? sectionId;
  final int? courseId;
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
      this.professorId,
      required this.isActive,
      this.locationId,
      this.dayOfWeekId,
      this.classStart,
      this.classEnd,
      required this.isOnline,
      required this.courseId,
      required this.sectionId,
      required this.createdAt,
      this.updatedAt});

  factory Subject.fromSqlfliteDatabase(Map<String, dynamic> map) => Subject(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? '',
        code: map['code'] ?? '',
        description: map['description'] ?? '',
        units: map['units']?.toInt() ?? 0,
        professorId: map['professor_id']?.toInt() ?? 0,
        locationId: map['location_id']?.toInt() ?? 0,
        dayOfWeekId: map['day_of_week_id']?.toInt() ?? 0,
        classEnd: map['class_end'] ?? '',
        classStart: map['class_start'] ?? '',
        courseId: map['course_id']?.toInt() ?? 0,
        sectionId: map['section_id']?.toInt() ?? 0,
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
