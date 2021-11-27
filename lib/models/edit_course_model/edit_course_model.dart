import 'package:flutter/material.dart';
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
