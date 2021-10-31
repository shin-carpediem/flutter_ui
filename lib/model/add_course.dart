import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCourseModel extends ChangeNotifier {
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

    await FirebaseFirestore.instance.collection('courseCard').add({
      'title': title,
      'subtitle': subtitle,
      'logoUrl': logoUrl,
    });
  }
}
