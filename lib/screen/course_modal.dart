// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

void modalBottomSheet(context, model, course) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit'),
            onTap: () => {
              editCoursesSheet(context, model),
              // model.fetchCourseCard(),
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
            onTap: () => {
              // TODO: providerで引き継げていない
              model.deleteCourse(course),
              Navigator.pop(context),
              // model.fetchCourseCard(),
            },
          ),
        ],
      );
    },
  );
}

// TODO: providerで引き継げていない
void editCoursesSheet(context, model) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              // controller: model.logoUrlController,
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
              // controller: model.titleController,
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
              // controller: model.subtitleController,
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
      );
    },
  );
}
