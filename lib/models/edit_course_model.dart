import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/course_card_domain.dart';

class EditCourseModel extends ChangeNotifier {
  final CourseCardModel course;
  EditCourseModel(this.course) {
    titleController.text = course.title;
    subtitleController.text = course.subtitle;
    logoUrlController.text = course.logoUrl;
  }

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final logoUrlController = TextEditingController();

  String? title;
  String? subtitle;
  String? logoUrl;

  void setTitle(String title) {
    this.title = title;
    if (title.length >= 15) {
      throw 'Title can be less than 15 letters';
    }
    notifyListeners();
  }

  void setSubTitle(String subtitle) {
    this.subtitle = subtitle;
    notifyListeners();
    if (subtitle.length >= 30) {
      throw 'Subtitle can be less than 30 letters';
    }
  }

  void setlogoUrl(String logoUrl) {
    this.logoUrl = logoUrl;
    notifyListeners();
  }

  bool isUpdated() {
    return title != null || subtitle != null || logoUrl != null;
  }

  Future update() async {
    title = titleController.text;
    subtitle = subtitleController.text;
    logoUrl = logoUrlController.text;

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
