import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'add_course_model.freezed.dart';

@freezed
class AddCourseState with _$AddCourseState {
  const factory AddCourseState({
    String? title,
    String? subtitle,
    String? logoUrl,
  }) = _AddCourseState;
}

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


// class AddCourseModel extends ChangeNotifier {
//   String? title;
//   String? subtitle;
//   String? logoUrl;

//   Future addCourse() async {
//     if (title == null || title!.isEmpty) {
//       throw 'Title is not input.';
//     }

//     if (subtitle == null || subtitle!.isEmpty) {
//       throw 'subtitle is not input.';
//     }

//     if (logoUrl == null || logoUrl!.isEmpty) {
//       throw 'logo is not input.';
//     }

//     if (title!.length >= 15) {
//       throw 'Title can be less than 15 letters';
//     }

//     if (subtitle!.length >= 30) {
//       throw 'Subtitle can be less than 30 letters';
//     }

//     await FirebaseFirestore.instance.collection('courseCard').add({
//       'title': title,
//       'subtitle': subtitle,
//       'logoUrl': logoUrl,
//     });
//   }
// }
