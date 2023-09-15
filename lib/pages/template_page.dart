import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplatePage extends StatelessWidget {
  final Widget child;
  final String title;

  TemplatePage(this.child, this.title);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.chevron_left),
          ),
          middle: Text(title),
        ),
        child: child);
  }
}
