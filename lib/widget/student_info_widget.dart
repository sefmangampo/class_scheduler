import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> studentInfo = {
  "Course:": "BIT-FSM",
  "ID Number:": '2312100',
  'Full Course:':
      'Bachelor of Industrial Technology Major in Food and Service Management',
  "Name:": 'Pernia, Aurvel Sorio',
  "Section:": 'BIT 1-40 FSM-A',
  'EAF No:': '209620'
};

class StudentInfoWidget extends StatefulWidget {
  const StudentInfoWidget({super.key});

  @override
  State<StudentInfoWidget> createState() => _StudentInfoWidgetState();
}

class _StudentInfoWidgetState extends State<StudentInfoWidget> {
  @override
  Widget build(BuildContext context) => Card();
}
