import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/course_card_model/course_card_model.dart';
import 'package:state_notifier/state_notifier.dart';

class EditCourseController extends StateNotifier<CourseCardState> {
  EditCourseController() : super(const CourseCardState());

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final logoUrlController = TextEditingController();

  // modal上にsnacbar等のUIを設置していないので、throwの吐き出し場所がなくエラーになる
  // void setTitle(String? title) {
  //   if (title == null) {
  //     throw 'hoge';
  //   }
  // }

  // void setSubTitle(String? subTitle) {
  //   if (subTitle == null) {
  //     throw 'hoge';
  //   }
  // }

  // void setlogoUrl(String? logoUrl) {
  //   if (logoUrl == null) {
  //     throw 'logoUrl cannot be null';
  //   }
  // }

  bool isUpdated(title, subtitle, logoUrl) {
    return title != null || subtitle != null || logoUrl != null;
  }

  Future update(final course) async {
    String title = titleController.text;
    String subtitle = subtitleController.text;
    String logoUrl = logoUrlController.text;

    await FirebaseFirestore.instance
        .collection('courseCard')
        .doc(course.id)
        .update({
      'title': title,
      'subtitle': subtitle,
      'logoUrl': logoUrl,
    });
  }
}
