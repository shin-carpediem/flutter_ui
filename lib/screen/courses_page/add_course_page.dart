// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/model/add_course.dart';
import 'package:provider/provider.dart';

class AddCoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddCourseModel>(
      create: (_) => AddCourseModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('You can add your new course.'),
        ),
        body: SafeArea(
          child: Consumer<AddCourseModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Logo",
                      ),
                      onChanged: (text) {
                        model.logoUrl = text;
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
                      ),
                      onChanged: (text) {
                        model.title = text;
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Subtitle",
                      ),
                      onChanged: (text) {
                        model.subtitle = text;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await model.addCourse();
                          final snackBar = SnackBar(
                            backgroundColor: Colors.blue,
                            content: Text('New course is added!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } catch (e) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text("Save"),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
