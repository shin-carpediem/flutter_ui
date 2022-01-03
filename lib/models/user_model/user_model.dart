import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    String? name,
    String? email,
    String? desc,
    String? iconUrl,
    DocumentReference? companyRef,
    @Default(false) bool isLoading,
  }) = _UserState;
}
