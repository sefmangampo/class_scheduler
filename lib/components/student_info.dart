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

_createRows() {
  List<Widget> list = List.empty(growable: true);
  for (var key in studentInfo.keys) {
    list.add(Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                key,
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
          Expanded(
            child: Text(
              studentInfo[key],
              style: TextStyle(fontSize: 10),
            ),
          )
        ],
      ),
    ));
  }
  return Column(children: list);
}

class StudentInfoView extends StatelessWidget {
  const StudentInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Card(
        child: Column(
          children: [_createRows()],
        ),
      ),
    );
  }
}
