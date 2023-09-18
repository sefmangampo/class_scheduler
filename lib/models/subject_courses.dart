import 'package:san_na_ko/models/course.dart';

class SubjectCourses {
  final int id;
  final String name;
  final Course course;
  final String createdAt;
  final String? updatedAt;

  SubjectCourses(
      {required this.id,
      required this.name,
      required this.course,
      required this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'course': course,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
