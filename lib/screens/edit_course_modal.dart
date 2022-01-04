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
  print(CourseCardState);
  print(doc['logoUrl']);
  final _titleFocusNode = FocusNode();
  final _subTitleFocusNode = FocusNode();

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          // initialValue: doc['logoUrl'].toString(),
          controller: editCourseController.logoUrlController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Logo",
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty) {
              return 'logoUrl cannot be null';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(_titleFocusNode);
          },
          // onChanged: (text) {
          //   // TODO: データを表示させる
          //   editCourseController.setlogoUrl(text);
          // },
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: editCourseController.titleController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Title",
          ),
          // onChanged: (text) {
          //   editCourseController.setTitle(text);
          // },
          focusNode: _titleFocusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.length >= 15) {
              return 'Title can be less than 15 letters';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(_subTitleFocusNode);
          },
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: editCourseController.subtitleController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Subtitle",
          ),
          // onChanged: (text) {
          //   editCourseController.setSubTitle(text);
          // },
          focusNode: _subTitleFocusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.length >= 30) {
              return 'Subtitle can be less than 30 letters';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          // 保存されているデータと全く同じであれば
          // そもそも更新ボタンをdeactivateしておく
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
