// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/core/course_card_domain.dart';
import 'package:flutter_ui/main.dart';
import 'package:flutter_ui/models/course_card_modal/course_card_modal.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                onTap: () {
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
      return ModalBottomSheetWidget(courseCard);
    },
  );
}

class ModalBottomSheetWidget extends HookConsumerWidget {
  final CourseCardModel courseCard;
  const ModalBottomSheetWidget(this.courseCard);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editCourseState = ref.read(EditCourseProvider);
    final editCourseController = ref.read(EditCourseProvider.notifier);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: editCourseController.logoUrlController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Logo",
            ),
            onChanged: (text) {
              // TODO: データを表示させる
              editCourseController.setlogoUrl(text);
            },
          ),
          SizedBox(height: 8),
          TextField(
            controller: editCourseController.titleController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Title",
            ),
            onChanged: (text) {
              editCourseController.setTitle(text);
            },
          ),
          SizedBox(height: 8),
          TextField(
            controller: editCourseController.subtitleController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Subtitle",
            ),
            onChanged: (text) {
              editCourseController.setSubTitle(text);
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: editCourseController.isUpdated(
              editCourseState.title,
              editCourseState.subtitle,
              editCourseState.logoUrl,
            )
                ? () async {
                    try {
                      await editCourseController.update(courseCard);
                      Navigator.of(context)
                        ..pop(context)
                        ..pop(context);
                      // context.read<CourseCard>().fetchCourseCard();
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
  }
}
