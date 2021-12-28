import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'mypage_model.freezed.dart';

@freezed
class MyPageState with _$MyPageState {
  const factory MyPageState({
    String? name,
    String? email,
    String? desc,
    String? iconUrl,
    @Default(false) bool isLoading,
  }) = _MyPageState;
}
