import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'edit_profile_model.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    String? name,
    String? desc,
  }) = _EditProfileState;
}
