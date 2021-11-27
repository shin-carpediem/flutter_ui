import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'signup_model.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    String? email,
    String? password,
    @Default(false) bool isLoading,
  }) = _SignUpState;
}
