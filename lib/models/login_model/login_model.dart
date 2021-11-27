import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'login_model.freezed.dart';

@freezed
class LogInState with _$LogInState {
  const factory LogInState({
    String? email,
    String? password,
    @Default(false) bool isLoading,
  }) = _LogInState;
}
