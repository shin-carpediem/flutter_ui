import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ui/models/course_card_model/course_card_model.dart';
import 'package:state_notifier/state_notifier.dart';

class CourseCardController extends StateNotifier<CourseCardState> {
  CourseCardController() : super(const CourseCardState());

  void dragAndDrop(
    int oldIndex,
    int newIndex,
    List courseCards,
  ) {
    // 移動前のindexより移動後のindexが大きい場合、
    // itemの長さがlistの保有数よりも1大きくなってしまうため、
    // newIndexから1引く。
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final CourseCardState reorderedCourseCard = courseCards.removeAt(oldIndex);
    courseCards.insert(newIndex, reorderedCourseCard);
  }

  Future changefavorite(
    String id, // courseCardのID
    String uid,
    List<dynamic> favoriteList,
  ) async {
    if (favoriteList.contains(uid)) {
      favoriteList.remove(uid);
    } else {
      favoriteList.add(uid);
    }
    int favoriteNum = favoriteList.length;
    await FirebaseFirestore.instance.collection('courseCard').doc(id).update({
      'favoriteList': favoriteList,
      'favoriteNum': favoriteNum,
    });
  }
}
