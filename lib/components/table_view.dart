import 'package:flutter/material.dart';

List<Widget> _buildCells(int count) {
  return List.generate(
    count,
    (index) => Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.white,
      margin: EdgeInsets.all(4.0),
      child: Text("${index + 1}"),
    ),
  );
}

_buildRows(int count) {
  return [
    _buildHeader(),
    List.generate(
      count,
      (index) => Row(
        children: _buildCells(7),
      ),
    )
  ];
}

_buildHeader() {
  var weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  List<Container> list = List.empty(growable: true);
  for (var i = 0; i < weekDays.length; i++) {
    list.add(Container(
      alignment: Alignment.center,
      width: 90.0,
      height: 30.0,
      color: Color.fromARGB(255, 214, 41, 128),
      margin: EdgeInsets.all(2.0),
      child: Text(
        weekDays[i],
        style: TextStyle(fontSize: 10),
      ),
    ));
  }

  return (Row(children: list));
}

_buildSchedules() {}

_buildTimeColumn() {
  List<String> generateTimeString() {
    List<String> strList = List.empty(growable: true);

    for (var i = 0; i < 15; i++) {
      if (i == 0) {
        strList.add("Time");
      } else {
        var trail = i > 5 ? 'pm' : 'am';
        var hour = i > 6 ? i - 5 : i + 6;

        strList.add("$hour:00$trail - ${hour + 1}:00$trail");
      }
    }

    return strList;

    //List.generate(15, (index) => "${index + 6}");
  }

  var firstColumn = generateTimeString();

  List<Container> list = List.empty(growable: true);
  for (var i = 0; i < firstColumn.length; i++) {
    list.add(Container(
      alignment: Alignment.center,
      width: 90.0,
      height: 30.0,
      color: Color.fromARGB(255, 214, 119, 41),
      margin: EdgeInsets.all(2.0),
      child: Text(
        firstColumn[i],
        style: TextStyle(fontSize: 10),
      ),
    ));
  }
  return list;
}

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});
  @override
  Widget build(BuildContext context) {
    return (SingleChildScrollView(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildTimeColumn(),
        ),
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('hehe'),
                Text('hehe'),
                Column(
                  children: [_buildHeader(), Text('sdfdsf'), Text('heheh')],
                )
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
