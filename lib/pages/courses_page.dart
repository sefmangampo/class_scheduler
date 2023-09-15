import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../database/app_db.dart';
import '../models/course.dart';
import '../widget/create_course_widget.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  Future<List<Course>>? courses;
  final appDB = AppDB();

  @override
  void initState() {
    super.initState();

    fetchCourses();
  }

  void fetchCourses() {
    setState(() {
      courses = appDB.getCourses();

      print("here in state");
      print(courses);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('hello from course'),
        ),
        body: FutureBuilder<List<Course>>(
            future: courses,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print("here in true");
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                print("here in faklse");
                print(snapshot);
                print("here in faklse");

                final courses = snapshot.data!;

                return courses.isEmpty
                    ? Center(
                        child: Text('No course...',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 28)))
                    : ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 12,
                        ),
                        itemCount: courses.length,
                        itemBuilder: (context, index) {
                          final course = courses[index];
                          final subtitle = DateFormat('yyyy/MM/dd').format(
                              DateTime.parse(
                                  course.updatedAt ?? course.createdAt));

                          return ListTile(
                            title: Text(
                              course.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(subtitle),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () async {
                                await appDB.removeCourse(course.id);
                              },
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => CreateCourseWidget(
                                      course: course,
                                      onSubmit: (name) async {
                                        await appDB.editCourse(
                                            course.id,
                                            course.name,
                                            course.fullname,
                                            course.description,
                                            course.isActive);

                                        fetchCourses();
                                        if (!mounted) return;
                                        Navigator.of(context).pop();
                                      }));
                            },
                          );
                        },
                      );
              }
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => CreateCourseWidget(
                      onSubmit: (title) async {
                        await appDB.createCourse(
                            'name', 'fullname', 'description');
                        if (!mounted) return;
                        fetchCourses();
                        Navigator.of(context).pop();
                      },
                    ));
          },
        ),
      );
}
