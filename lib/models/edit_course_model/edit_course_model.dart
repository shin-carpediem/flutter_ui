import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/course_card_domain.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'edit_course_model.freezed.dart';

@freezed
class EditCourseState with _$EditCourseState {
  const factory EditCourseState({
    String? title,
    String? subtitle,
    String? logoUrl,
  }) = _EditCourseState;
}

class EditCourseModel extends StateNotifier<EditCourseState> {
  EditCourseModel() : super(const EditCourseState());

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final logoUrlController = TextEditingController();

  void setTitle(String title) {
    if (title.length >= 15) {
      // TODO: エラーメッセージを正しく表示させる
      throw 'Title can be less than 15 letters';
    }
    state = state.copyWith(title: title);
  }

  void setSubTitle(String subtitle) {
    if (subtitle.length >= 30) {
      throw 'Subtitle can be less than 30 letters';
    }
    state = state.copyWith(subtitle: subtitle);
  }

  void setlogoUrl(String logoUrl) => state = state.copyWith(logoUrl: logoUrl);

  bool isUpdated(title, subtitle, logoUrl) {
    return title != null || subtitle != null || logoUrl != null;
  }

  Future update(final CourseCardModel course) async {
    String title = titleController.text;
    String subtitle = subtitleController.text;
    String logoUrl = logoUrlController.text;

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


// class EditCourseModel extends ChangeNotifier {
//   final CourseCardModel course;
//   EditCourseModel(this.course) {
//     titleController.text = course.title;
//     subtitleController.text = course.subtitle;
//     logoUrlController.text = course.logoUrl;
//   }

//   Future update() async {
//     title = titleController.text;
//     subtitle = subtitleController.text;
//     logoUrl = logoUrlController.text;

//     await FirebaseFirestore.instance
//         .collection('courseCard')
//         .doc(course.id)
//         .update({
//       'title': title,
//       'subtitle': subtitle,
//       'logoUrl': logoUrl,
//     });
//   }
// }
