import 'package:flutter/material.dart';
import 'package:san_na_ko/components/student_info.dart';

class RegistrationInfoWidget extends StatefulWidget {
  const RegistrationInfoWidget({super.key});

  @override
  State<RegistrationInfoWidget> createState() => _RegistrationInfoWidgetState();
}

class _RegistrationInfoWidgetState extends State<RegistrationInfoWidget> {
  @override
  Widget build(Object context) => Card(
        child: StudentInfoView(),
      );
}
