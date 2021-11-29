// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddCoursePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addCourseController = ref.read(AddCourseProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
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
                    addCourseController.logoUrl = text;
                  },
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                  ),
                  onChanged: (text) {
                    addCourseController.title = text;
                  },
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Subtitle",
                  ),
                  onChanged: (text) {
                    addCourseController.subtitle = text;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await addCourseController.addCourse();
                      Navigator.of(context).pop(true);
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
        ),
      ),
    );
  }
}
