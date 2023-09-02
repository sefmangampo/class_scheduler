class Student {
  final String firstname;
  final String? middlename;
  final String lastname;
  final String idNumber;
  final bool isMale;
  final int? courseId;
  final int? sectionId;
  final int id;
  final bool isActive;
  final String createdAt;
  final String? updatedAt;

  Student(
      {required this.firstname,
      required this.lastname,
      this.middlename,
      required this.id,
      required this.idNumber,
      required this.isMale,
      required this.createdAt,
      required this.isActive,
      required this.courseId,
      required this.sectionId,
      this.updatedAt});

  factory Student.fromSqlfliteDatabase(Map<String, dynamic> map) => Student(
        id: map['id']?.toInt() ?? 0,
        firstname: map['firstname'] ?? '',
        middlename: map['middlename'] ?? '',
        lastname: map['lastname'] ?? '',
        idNumber: map['id_number'] ?? '',
        courseId: map['course_id']?.toInt() ?? 0,
        sectionId: map['section_id']?.toInt() ?? 0,
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
