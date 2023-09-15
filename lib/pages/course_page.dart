import 'package:flutter/cupertino.dart';
import 'package:san_na_ko/pages/template_page.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplatePage(_child(), 'Courses');
  }
}

_child() {
  return Text('hello from Courses');
}
