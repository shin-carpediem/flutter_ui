// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/controller/edit_course_controller.dart';
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
                  editCoursesSheet(
                    context,
                    courseCard,
                    model,
                  );
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
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: context.read<EditCourseModel>().logoUrlController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Logo",
              ),
              onChanged: (text) {
                // TODO: データを表示させる
                context.read<EditCourseModel>().setlogoUrl(text);
              },
            ),
            SizedBox(height: 8),
            TextField(
              controller: context.read<EditCourseModel>().titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
              onChanged: (text) {
                context.read<EditCourseModel>().setTitle(text);
              },
            ),
            SizedBox(height: 8),
            TextField(
              controller: context.read<EditCourseModel>().subtitleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Subtitle",
              ),
              onChanged: (text) {
                context.read<EditCourseModel>().setSubTitle(text);
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: context.read<EditCourseModel>().isUpdated(
                        context.read<EditCourseState>().title,
                        context.read<EditCourseState>().subtitle,
                        context.read<EditCourseState>().logoUrl,
                      )
                  ? () async {
                      try {
                        await context
                            .read<EditCourseModel>()
                            .update(courseCard);
                        Navigator.of(context).pop(context);
                        Navigator.of(context).pop(context);
                        context.read<CourseCard>().fetchCourseCard();
                      } catch (e) {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(e.toString()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  : null,
              child: Text("Update"),
            ),
          ],
        ),
      );
    },
  );
}
