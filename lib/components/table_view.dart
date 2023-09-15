import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final weekdays = DateFormat().dateSymbols.WEEKDAYS;

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

_headerCell(String s) {
  return Container(
    alignment: Alignment.center,
    width: 90.0,
    height: 30.0,
    color: Color.fromARGB(255, 214, 119, 41),
    margin: EdgeInsets.all(2.0),
    child: Text(
      s,
      style: TextStyle(fontSize: 10),
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

_generateColumns(int number) {
  List<Container> list = List.empty(growable: true);
  for (var i = 1; i < number; i++) {
    list.add(Container(
      alignment: Alignment.center,
      width: 90.0,
      height: 30.0,
      color: Color.fromARGB(255, 41, 162, 214),
      margin: EdgeInsets.all(2.0),
      child: Text(
        '',
        style: TextStyle(fontSize: 10),
      ),
    ));
  }

  return (Column(children: list));
}

_buildDayColumn(int dayNumber) {
  var day = weekdays[dayNumber];

  return Column(
    children: [_headerCell(day), _generateColumns(15)],
  );
}

_buildHeader() {
  List<Container> list = List.empty(growable: true);
  for (var i = 1; i < weekdays.length; i++) {
    list.add(Container(
      alignment: Alignment.center,
      width: 90.0,
      height: 30.0,
      color: Color.fromARGB(255, 41, 145, 214),
      margin: EdgeInsets.all(2.0),
      child: Text(
        weekdays[i],
        style: TextStyle(fontSize: 10),
      ),
    ));
  }

  return (Row(children: list));
}

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDayColumn(1),
                _buildDayColumn(2),
                _buildDayColumn(3),
                _buildDayColumn(4),
                _buildDayColumn(5),
                _buildDayColumn(6),
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
