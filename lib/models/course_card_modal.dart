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
      final bool favorite = data['favorite'];
      final List<String> favoriteList =
          data['favoriteList'].cast<String>() as List<String>;
      final int favoriteNum = data['favoriteNum'];

      return CourseCardModel(
        id,
        key,
        title,
        subtitle,
        logoUrl,
        favorite,
        favoriteList,
        favoriteNum,
      );
    }).toList();

    this.courseCards = courseCards;
    notifyListeners();
  }

  void dragAndDrop(
    int oldIndex,
    int newIndex,
    List<CourseCardModel> courseCards,
  ) {
    // 移動前のindexより移動後のindexが大きい場合、
    // itemの長さがlistの保有数よりも1大きくなってしまうため、
    // newIndexから1引く。
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    print(courseCards);

    final CourseCardModel reorderedCourseCard = courseCards.removeAt(oldIndex);
    courseCards.insert(newIndex, reorderedCourseCard);
    notifyListeners();
  }

  Future deleteCourse(CourseCardModel courseCard) {
    return FirebaseFirestore.instance
        .collection('courseCard')
        .doc(courseCard.id)
        .delete();
  }

  Future changefavorite(
    CourseCardModel courseCard,
    bool favorite,
  ) async {
    if (favorite) {
      favorite = false;
    } else {
      favorite = true;
    }
    await FirebaseFirestore.instance
        .collection('courseCard')
        .doc(courseCard.id)
        .update({
      'favorite': favorite,
    });
    notifyListeners();
  }
}
