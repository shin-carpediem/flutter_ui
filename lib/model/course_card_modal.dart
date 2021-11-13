// ignore_for_file: prefer_const_constructors, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/course_card_domain.dart';

class CourseCard extends ChangeNotifier {
  List<CourseCardModel>? courseCards;

  void fetchCourseCard() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('courseCard').get();

    final List<CourseCardModel> courseCards =
        snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;

      final String id = document.id;
      final String title = data['title'];
      final String subtitle = data['subtitle'];
      final String logoUrl = data['logoUrl'];

      return CourseCardModel(id, title, subtitle, logoUrl);
    }).toList();

    this.courseCards = courseCards;
    notifyListeners();
  }

  Future deleteCourse(CourseCardModel course) {
    return FirebaseFirestore.instance
        .collection('courseCard')
        .doc(course.id)
        .delete();
  }
}
