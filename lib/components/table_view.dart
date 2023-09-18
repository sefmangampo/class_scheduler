// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:san_na_ko/models/scheduled_item.dart';

final weekdays = DateFormat().dateSymbols.WEEKDAYS;
final dataKey = GlobalKey();
var date = DateTime.now();
const columnLength = 18;
const cellHeight = 60.0;
const cellWidth = 90.0;

var currentDayOfWeek = DateFormat.EEEE().format(date);
int currentWeekDayId = weekdays.indexOf(currentDayOfWeek);

Color headerCellColor = Color.fromARGB(255, 214, 119, 41);
Color specialColumnColor = Color.fromARGB(255, 41, 162, 214);
Color normalColumnColor = Color.fromARGB(255, 40, 95, 118);
Color currentHourColor = Color.fromARGB(255, 156, 101, 18);
Color scheduledColor = Color.fromARGB(255, 18, 156, 78);

_headerCell(String s) {
  return Container(
    alignment: Alignment.center,
    width: cellWidth,
    height: cellHeight,
    color: headerCellColor,
    margin: EdgeInsets.all(2.0),
    child: Text(
      s,
      style: TextStyle(fontSize: 10),
    ),
  );
}

getTileColor(int index, int day) {
  int currentHour = int.parse(DateFormat.H().format(date)) - 5;

  if (day != currentWeekDayId) return normalColumnColor;
  if (index != currentHour) return specialColumnColor;

  return currentHourColor;
}

_generateColumns(int day, List<ScheduledItem> columnItems) {
  List<GestureDetector> list = List.empty(growable: true);

  outerloop:
  for (var i = 1; i < columnLength; i++) {
    if (columnItems.isNotEmpty) {
      for (var card in columnItems) {
        if (card.startHour == i && card.day == day) {
          list.add(GestureDetector(
            onTap: () {
              print("you clicked me: ${card.name}");
            },
            child: Draggable(
              data: card,
              feedback: Container(
                width: cellWidth,
                color: scheduledColor,
                height: (cellHeight * card.duration) + 4 * card.duration - 4,
                child: Text(card.name),
              ),
              child: Container(
                key: card.id == 5 ? dataKey : null,
                alignment: Alignment.center,
                width: cellWidth,
                height: (cellHeight * card.duration) + 4 * card.duration - 4,
                color: scheduledColor,
                margin: EdgeInsets.all(2.0),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'sub: ${card.name} - duration: ${card.duration}',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ),
          ));
        }

        if (i >= card.startHour && i < card.endHour) {
          continue outerloop;
        }
      }
    }

    list.add(GestureDetector(
      child: DragTarget(
        onWillAccept: (data) {
          var scheduledData = data as ScheduledItem;

          print("data: ${scheduledData.name}");

          return true;
        },
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            alignment: Alignment.center,
            width: cellWidth,
            height: cellHeight,
            color: getTileColor(i, day),
            margin: EdgeInsets.all(2.0),
            child: Text(
              'index: $i',
              style: TextStyle(fontSize: 10),
            ),
          );
        },
      ),
    ));
  }

  return (Column(children: list));
}

_buildDayColumn(int dayNumber, List<ScheduledItem> items) {
  var day = weekdays[dayNumber];

  return Column(
    children: [_headerCell(day), _generateColumns(dayNumber, items)],
  );
}

_buildTimeColumn() {
  parseTime(int hour) {
    int baseHour = hour + 5;
    String trailing = baseHour > 11 ? "pm" : "am";

    if (baseHour > 12) {
      baseHour = baseHour - 12;
    }
    return "$baseHour:00 $trailing";
  }

  List<String> generateTimeString() {
    List<String> strList = List.empty(growable: true);

    for (var i = 0; i < columnLength; i++) {
      if (i == 0) {
        var currentHour = DateFormat.H().format(date);
        strList.add("Time: $currentHour");
      } else {
        var currentHour = parseTime(i);
        var nextHour = parseTime(i + 1);

        strList.add("$currentHour - $nextHour");
      }
    }

    return strList;
  }

  var firstColumn = generateTimeString();

  List<Container> list = List.empty(growable: true);
  for (var i = 0; i < firstColumn.length; i++) {
    list.add(Container(
      alignment: Alignment.center,
      width: cellWidth,
      height: cellHeight,
      color: headerCellColor,
      margin: EdgeInsets.all(2.0),
      child: Text(
        firstColumn[i],
        style: TextStyle(fontSize: 10),
      ),
    ));
  }
  return list;
}

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

_sortAndFilterSchedules(List<ScheduledItem> unsortedItems, int dayIndex) {
  var currentDayItems =
      unsortedItems.where((element) => element.day == dayIndex);
  var sortedDayItems = currentDayItems.toList();
  sortedDayItems.sort((a, b) => a.startHour.compareTo(b.startHour));

  return _buildDayColumn(dayIndex, sortedDayItems);
}

class _ScheduleViewState extends State<ScheduleView> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer.periodic(const Duration(seconds: 5), (Timer timer) {
  //     Scrollable.ensureVisible(dataKey.currentContext as BuildContext);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<ScheduledItem> currentSubjects = List.empty(growable: true);

    currentSubjects.add(ScheduledItem(
        id: 1, name: 'First Subject', day: 3, startHour: 2, endHour: 8));
    currentSubjects.add(ScheduledItem(
        id: 2, name: 'Second Subject', day: 1, startHour: 5, endHour: 7));
    currentSubjects.add(ScheduledItem(
        id: 3, name: 'Third Subject', day: 5, startHour: 2, endHour: 3));
    currentSubjects.add(ScheduledItem(
        id: 4, name: 'Fourth Subject', day: 5, startHour: 3, endHour: 4));
    currentSubjects.add(ScheduledItem(
        id: 5, name: 'Fifth Subject', day: 5, startHour: 7, endHour: 8));
    currentSubjects.add(ScheduledItem(
        id: 6, name: 'Sixth Subject', day: 1, startHour: 1, endHour: 2));

    return (SingleChildScrollView(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildTimeColumn(),
        ),
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 55),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sortAndFilterSchedules(currentSubjects, 1),
                  _sortAndFilterSchedules(currentSubjects, 2),
                  _sortAndFilterSchedules(currentSubjects, 3),
                  _sortAndFilterSchedules(currentSubjects, 4),
                  _sortAndFilterSchedules(currentSubjects, 5),
                  _sortAndFilterSchedules(currentSubjects, 6),
                  _sortAndFilterSchedules(currentSubjects, 0),
                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
