// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ui/core/course_card_domain.dart';

// TODO: 複数のモデルを使えるようになれば、
// recommendedで、以下のコードが使える
// class FavoriteCourseModel extends ChangeNotifier {
//   final CourseCardModel course;
//   FavoriteCourseModel(this.course) {
//     favorite = course.favorite;
//   }

//   bool? favorite;

//   void setFavorite(bool favorite) {
//     this.favorite = favorite;
//     // TODO: 連打防止
//     notifyListeners();
//   }

//   Future changefavorite(
//     CourseCardModel courseCard,
//     bool favorite,
//   ) async {
//     if (favorite) {
//       favorite = false;
//     } else {
//       favorite = true;
//     }
//     await FirebaseFirestore.instance
//         .collection('courseCard')
//         .doc(courseCard.id)
//         .update({
//       'favorite': favorite,
//     });
//     notifyListeners();
//   }
// }
