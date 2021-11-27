import 'package:flutter/material.dart';
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
