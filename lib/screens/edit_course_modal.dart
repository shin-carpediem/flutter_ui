// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

void modalBottomSheet(
  CourseCardState,
  courseCardController,
  editCourseController,
  context,
  doc,
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
                leading: const Icon(Icons.edit),
                title: const Text('Edit'),
                onTap: () {
                  editCoursesSheet(
                    context,
                    CourseCardState,
                    courseCardController,
                    editCourseController,
                    doc,
                  );
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete'),
            onTap: () async {
              await courseCardController.deleteCourse(doc);
              Navigator.pop(context);

              final snackBar = SnackBar(
                backgroundColor: Colors.red,
                content: Text('${doc['title']} is deleted.'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      );
    },
  );
}

void editCoursesSheet(
  context,
  CourseCardState,
  courseCardController,
  editCourseController,
  doc,
) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return modalBottomSheetWidget(
        context,
        editCourseController,
        CourseCardState,
        doc,
      );
    },
  );
}

// TODO: 入力前の最初の状態では初期値の保持がない。
// どのcourseCardでもcontrollerが同じ値を保持している。
Widget modalBottomSheetWidget(
  BuildContext context,
  editCourseController,
  CourseCardState,
  doc,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: editCourseController.logoUrlController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Logo",
          ),
          onChanged: (text) {
            // TODO: データを表示させる
            // editCourseController.setlogoUrl(text);
          },
        ),
        const SizedBox(height: 8),
        TextField(
          controller: editCourseController.titleController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Title",
          ),
          onChanged: (text) {
            editCourseController.setTitle(text);
          },
        ),
        const SizedBox(height: 8),
        TextField(
          controller: editCourseController.subtitleController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Subtitle",
          ),
          onChanged: (text) {
            editCourseController.setSubTitle(text);
          },
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: editCourseController.isUpdated(
            doc['title'],
            doc['subtitle'],
            doc['logoUrl'],
          )
              ? () async {
                  try {
                    await editCourseController.update(doc);
                    Navigator.of(context)
                      ..pop(context)
                      ..pop(context);
                  } catch (e) {
                    final snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(e.toString()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              : null,
          child: const Text("Update"),
        ),
      ],
    ),
  );
}
