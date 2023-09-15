import 'package:flutter/cupertino.dart';
import 'package:san_na_ko/pages/template_page.dart';

class SchoolYearPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplatePage(_child(), 'School Year');
  }
}

_child() {
  return Padding(
    padding: const EdgeInsets.only(top: 50),
    child: Column(children: [
      SizedBox(
        height: 200,
        child: CupertinoListSection.insetGrouped(
          header: Text('2023-2024'),
          children: _createListChildren(),
        ),
      ),
      SizedBox(
        height: 200,
        child: CupertinoListSection.insetGrouped(
          header: Text('2024-2025'),
          children: _createListChildren(),
        ),
      )
    ]),
  );
}

_createListChildren() {
  final List<String> entries = ['First Semester', 'Second Semester', 'Summer'];

  List<CupertinoListTile> tiles = List.empty(growable: true);

  for (var item in entries) {
    tiles.add(CupertinoListTile(title: Text(item)));
  }

  return tiles;
}
