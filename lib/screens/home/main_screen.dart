import 'package:flutter/material.dart';
import 'package:san_na_ko/screens/tabs/maintenance_tab.dart';
import 'package:san_na_ko/screens/tabs/profile_tab.dart';
import 'package:san_na_ko/screens/tabs/schedule_tab.dart';
import 'package:flutter/cupertino.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [ScheduleTab(), ProfileTab(), MaintentanceTab()];
    return SafeArea(
      child: CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month)),
            BottomNavigationBarItem(icon: Icon(Icons.person)),
            BottomNavigationBarItem(
                icon: Icon(Icons.drive_file_rename_outline)),
          ]),
          tabBuilder: (BuildContext context, int index) =>
              CupertinoTabView(builder: (context) {
            return tabs[index];
          }),
        ),
      ),
    );

    //     return SafeArea(
    //   child: CupertinoPageScaffold(
    //     child: CustomScrollView(
    //       slivers: [
    //         CupertinoSliverNavigationBar(
    //           largeTitle: Text('Scheduler'),
    //           trailing: Icon(Icons.settings),
    //         ),
    //         SliverFillRemaining(
    //           child: CupertinoTabScaffold(
    //             tabBar: CupertinoTabBar(items: [
    //               BottomNavigationBarItem(icon: Icon(Icons.calendar_month)),
    //               BottomNavigationBarItem(icon: Icon(Icons.person)),
    //               BottomNavigationBarItem(
    //                   icon: Icon(Icons.drive_file_rename_outline)),
    //             ]),
    //             tabBuilder: (BuildContext context, int index) =>
    //                 CupertinoTabView(builder: (context) {
    //               return tabs[index];
    //             }),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
