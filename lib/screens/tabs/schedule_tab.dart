import 'package:flutter/material.dart';
import 'package:san_na_ko/components/table_view.dart';
import 'package:san_na_ko/widget/current_class_widget.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({super.key});

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          CurrentClassWidget(),
          Flexible(child: SingleChildScrollView(child: ScheduleView()))
        ],
      );
}
