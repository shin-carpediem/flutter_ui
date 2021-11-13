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
      final String key = id.toString();
      final String title = data['title'];
      final String subtitle = data['subtitle'];
      final String logoUrl = data['logoUrl'];

      return CourseCardModel(id, key, title, subtitle, logoUrl);
    }).toList();

    this.courseCards = courseCards;
    notifyListeners();
  }

  // void dragAndDrop(int oldIndex, int newIndex) {
  //   if (oldIndex < newIndex) {
  //     // 移動前のインデックスより移動後のインデックスが大きい場合、
  //     // アイテムの長さがリストの保有数よりも1大きくなってしまうため、
  //     // newIndexから1引く。
  //     // 例えば、上の画像のように1番目のアイテムを3番目に移動した場合、
  //     // oldIndex = 0, newIndex = 3となるので、
  //     // newIndexを1引いて2とする。
  //     newIndex -= 1;
  //   }

  //   CourseCardModel draggableCourseCard = courseCards.removeAt(oldIndex);

  //   courseCards.insert(newIndex, draggableCourseCard);
  //   notifyListeners();
  // }

  Future deleteCourse(CourseCardModel course) {
    return FirebaseFirestore.instance
        .collection('courseCard')
        .doc(course.id)
        .delete();
  }
}
