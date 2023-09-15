import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:san_na_ko/pages/course_page.dart';
import 'package:san_na_ko/pages/instructor_page.dart';
import 'package:san_na_ko/pages/page.dart';
import 'package:san_na_ko/pages/section_page.dart';
import 'package:san_na_ko/pages/subject_page.dart';
import 'package:san_na_ko/pages/venue_page.dart';

class MaintentanceListWidget extends StatefulWidget {
  const MaintentanceListWidget({super.key});

  @override
  State<MaintentanceListWidget> createState() => _MaintentanceListWidgetState();
}

class _MaintentanceListWidgetState extends State<MaintentanceListWidget> {
  @override
  Widget build(BuildContext context) => CupertinoListSection.insetGrouped(
        header: Text('Records'),
        children: _createListChildren(context),
      );
}

_createListChildren(BuildContext context) {
  Map<String, dynamic> entriesMap = {
    'School Year:': SchoolYearPage(),
    'Subjects': SubjectPage(),
    'Course': CoursePage(),
  };

  List<CupertinoListTile> tiles = List.empty(growable: true);

  for (var entry in entriesMap.entries) {
    tiles.add(CupertinoListTile(
      title: Text(entry.key),
      leading: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
      ),
      additionalInfo: Text('2 items'),
      onTap: () => _goToPage(context, entry.value),
      trailing: Icon(Icons.chevron_right),
    ));
  }

  return tiles;
}

_goToPage(BuildContext context, Widget entry) {
  Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext c) {
    return entry;
  }));
}
