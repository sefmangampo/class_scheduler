import 'package:flutter/material.dart';
import 'package:san_na_ko/widget/maintanence_list_widget.dart';

class MaintentanceTab extends StatefulWidget {
  const MaintentanceTab({super.key});

  @override
  State<MaintentanceTab> createState() => _MaintentanceTabState();
}

class _MaintentanceTabState extends State<MaintentanceTab> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
          child: Column(
        children: [MaintentanceListWidget()],
      ));
}
