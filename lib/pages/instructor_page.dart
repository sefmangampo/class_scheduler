import 'package:flutter/cupertino.dart';
import 'package:san_na_ko/pages/template_page.dart';

class InstrutorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplatePage(_child(), 'Instructors');
  }
}

_child() {
  return Text('hello from instrucor');
}
