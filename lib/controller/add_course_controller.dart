import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ui/models/add_course_model/add_course_model.dart';
import 'package:state_notifier/state_notifier.dart';

class AddCourseModel extends StateNotifier<AddCourseState> {
  AddCourseModel() : super(const AddCourseState());
  String? title;
  String? subtitle;
  String? logoUrl;

  Future addCourse() async {
    if (title == null || title!.isEmpty) {
      throw 'Title is not input.';
    }

    if (subtitle == null || subtitle!.isEmpty) {
      throw 'subtitle is not input.';
    }

    if (logoUrl == null || logoUrl!.isEmpty) {
      throw 'logo is not input.';
    }

    if (title!.length >= 15) {
      throw 'Title can be less than 15 letters';
    }

    if (subtitle!.length >= 30) {
      throw 'Subtitle can be less than 30 letters';
    }

    await FirebaseFirestore.instance.collection('courseCard').add({
      'title': title,
      'subtitle': subtitle,
      'logoUrl': logoUrl,
      'favoriteList': [],
      'favoriteNum': 0,
    });
  }
}
