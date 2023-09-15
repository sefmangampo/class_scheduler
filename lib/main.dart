import 'package:flutter/material.dart';
import 'package:san_na_ko/pages/courses_page.dart';
import 'package:san_na_ko/screens/home/home_screen.dart';
import 'package:san_na_ko/screens/home/main_screen.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Namer App',
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: MainPage(),
    );
  }
}
