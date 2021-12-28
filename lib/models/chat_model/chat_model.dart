import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'chat_model.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    String? name,
    String? message,
    Timestamp? createdAt, 
  }) = _ChatState;
}
