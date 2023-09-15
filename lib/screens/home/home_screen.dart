import 'package:flutter/cupertino.dart';
import 'package:san_na_ko/components/table_view.dart';
import 'package:san_na_ko/components/student_info.dart';
//import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: CupertinoThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: Color.fromARGB(255, 18, 32, 47),
                primaryColor: CupertinoColors.systemOrange),
            home: CupertinoPageScaffold(
                resizeToAvoidBottomInset: false,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    CupertinoSliverNavigationBar(
                      largeTitle: Text('Subject Tracker'),
                      leading: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => {
                          showCupertinoDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  CupertinoAlertDialog(
                                    title: Text('Bakit lagi tayo nasasaktan'),
                                    content: Text('di naman'),
                                    actions: <CupertinoDialogAction>[
                                      CupertinoDialogAction(
                                        isDestructiveAction: true,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('uu'),
                                      ),
                                      CupertinoDialogAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('ndfe'),
                                      )
                                    ],
                                  ))
                        },
                        child: Text('Me'),
                      ),
                      trailing: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Text('Settings'),
                        onPressed: () => {
                          showCupertinoDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  CupertinoAlertDialog(
                                    title: Text('Bakit siya at di ako'),
                                    content: Text('malay ko'),
                                    actions: <CupertinoDialogAction>[
                                      CupertinoDialogAction(
                                        isDestructiveAction: true,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Siomai'),
                                      ),
                                      CupertinoDialogAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('palabok'),
                                      )
                                    ],
                                  ))
                        },
                      ),
                    )
                  ],
                  body: SingleChildScrollView(
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Current Class: 3 hours (40 mins left)',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  168, 213, 202, 201),
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'GE 1',
                                      //textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 244, 149, 54),
                                          fontSize: 25),
                                    ),
                                    Text(
                                      'Phil History',
                                      //textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 244, 149, 54),
                                          fontSize: 30),
                                    ),
                                    Text(
                                      'Ms. Santos',
                                      //textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 244, 149, 54),
                                          fontSize: 20),
                                    ),
                                    Text(
                                      '( 11am - 1pm, Building X )',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              192, 255, 255, 255),
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
                          ScheduleView(),
                          StudentInfoView()
                        ],
                      ),
                    )),
                  ),
                ))));
  }
}
