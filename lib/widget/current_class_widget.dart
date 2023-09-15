import 'package:flutter/material.dart';

class CurrentClassWidget extends StatefulWidget {
  const CurrentClassWidget({super.key});

  @override
  State<CurrentClassWidget> createState() => _CurrentClassWidgetState();
}

class _CurrentClassWidgetState extends State<CurrentClassWidget> {
  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Current Class: 3 hours (40 mins left)',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromARGB(168, 213, 202, 201),
                                fontSize: 18),
                          ),
                        ],
                      ),
                      Text(
                        'GE 1',
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 244, 149, 54),
                            fontSize: 25),
                      ),
                      Text(
                        'Phil History',
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 244, 149, 54),
                            fontSize: 30),
                      ),
                      Text(
                        'Ms. Santos',
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 244, 149, 54),
                            fontSize: 20),
                      ),
                      Text(
                        '( 11am - 1pm, Building X )',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color.fromARGB(192, 255, 255, 255),
                            fontSize: 20),
                      )
                    ],
                  ),
                )),
                Column(
                  children: [
                    Text(
                      'upcoming...',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Food Prep',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      '2:30pm',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
}
