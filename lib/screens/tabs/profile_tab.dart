import 'package:flutter/material.dart';
import 'package:san_na_ko/widget/registration_info_widget.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) => Column(
        children: [RegistrationInfoWidget(), Text('heelo')],
      );
}
