import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:san_na_ko/pages/template_page.dart';

class SectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplatePage(_child(), 'Sections');
  }
}

_child() {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: CupertinoListSection(
      header: Text('Sections'),
      children: _createListChildren(),
    ),
  );
}

_createListChildren() {
  final List<String> entries = ['Section 1', 'Section 2', 'Section 3'];

  List<CupertinoListTile> tiles = List.empty(growable: true);

  for (var item in entries) {
    tiles.add(CupertinoListTile(
      title: Text(item),
      trailing: Column(
        children: [Icon(Icons.delete)],
      ),
    ));
  }

  return tiles;
}
