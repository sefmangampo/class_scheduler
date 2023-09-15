import 'package:flutter/cupertino.dart';
import 'package:san_na_ko/pages/template_page.dart';

class VenuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplatePage(_child(), 'Venues');
  }
}

_child() {
  return Text('hello from Venes');
}
