// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/core/course_card_domain.dart';
import 'package:flutter_ui/models/course_card_modal/course_card_modal.dart';
import 'package:flutter_ui/models/edit_course_model/edit_course_model.dart';
import 'package:provider/provider.dart';

void modalBottomSheet(
  BuildContext context,
  CourseCardModel courseCard,
  CourseCard model,
) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit'),
                onTap: () async {
                  editCoursesSheet(context, courseCard, model);
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
            onTap: () async {
              await model.deleteCourse(courseCard);
              Navigator.pop(context);

              final snackBar = SnackBar(
                backgroundColor: Colors.red,
                content: Text('${courseCard.title} is deleted.'),
              );
              model.fetchCourseCard();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      );
    },
  );
}

void editCoursesSheet(
  BuildContext context,
  CourseCardModel courseCard,
  CourseCard model,
) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return ChangeNotifierProvider<EditCourseModel>(
        create: (_) => EditCourseModel(courseCard),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<EditCourseModel>(builder: (context, model, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: model.logoUrlController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Logo",
                  ),
                  onChanged: (text) {
                    model.setlogoUrl(text);
                  },
                ),
                SizedBox(height: 8),
                TextField(
                  controller: model.titleController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                  ),
                  onChanged: (text) {
                    model.setTitle(text);
                  },
                ),
                SizedBox(height: 8),
                TextField(
                  controller: model.subtitleController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Subtitle",
                  ),
                  onChanged: (text) {
                    model.setSubTitle(text);
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: model.isUpdated()
                      ? () async {
                          try {
                            await model.update();
                            Navigator.of(context).pop(context);
                            Navigator.of(context).pop(context);
                            // TODO: EditCourseModelではなく、CourseCardModelを使いたい
                          } catch (e) {
                            final snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(e.toString()),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      : null,
                  child: Text("Update"),
                ),
              ],
            );
          }),
        ),
      );
    },
  );
}
