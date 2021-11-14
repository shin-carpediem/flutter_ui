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

    if (title!.length >= 20) {
      throw 'Title can be less than 20 letters';
    }

    if (subtitle!.length >= 30) {
      throw 'Subtitle can be less than 30 letters';
    }

    await FirebaseFirestore.instance.collection('courseCard').add({
      'title': title,
      'subtitle': subtitle,
      'logoUrl': logoUrl,
    });
  }
}
