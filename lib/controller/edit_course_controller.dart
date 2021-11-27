import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/course_card_domain.dart';
import 'package:flutter_ui/models/edit_course_model/edit_course_model.dart';
import 'package:state_notifier/state_notifier.dart';

class EditCourseModel extends StateNotifier<EditCourseState> {
  EditCourseModel() : super(const EditCourseState());

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

  bool isUpdated(title, , logoUrl) {
    return title != null || subtitle != null || logoUrl != null;
  }

  Future update(final CourseCardModel course) async {
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
