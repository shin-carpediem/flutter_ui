import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'app_theme_model.freezed.dart';

@freezed
class AppThemeState with _$AppThemeState {
  const factory AppThemeState({
    @Default(false) bool isDark,
  }) = _AppThemeState;
}
