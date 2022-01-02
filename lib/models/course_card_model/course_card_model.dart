import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'course_card_model.freezed.dart';

@freezed
class CourseCardState with _$CourseCardState {
  const factory CourseCardState({
  String? id,
  String? title,
  String? subtitle,
  String? logoUrl,
  @Default([]) List<String> favoriteList,
  @Default(0) int favoriteNum,
  }) = _CourseCardState;
}
