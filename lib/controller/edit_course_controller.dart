import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/course_card_model/course_card_model.dart';
import 'package:state_notifier/state_notifier.dart';

class EditCourseController extends StateNotifier<CourseCardState> {
  EditCourseController() : super(const CourseCardState());

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final logoUrlController = TextEditingController();

  void setTitle(String title) {
    if (title.length >= 15) {
      throw 'Title can be less than 15 letters';
    }
    state = state.copyWith(title: titleController.text);
  }

  void setSubTitle(String subtitle) {
    if (subtitle.length >= 30) {
      throw 'Subtitle can be less than 30 letters';
    }
    state = state.copyWith(subtitle: subtitleController.text);
  }

  void setlogoUrl(String logoUrl) =>
      state = state.copyWith(logoUrl: subtitleController.text);

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
