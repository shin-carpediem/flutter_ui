import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'chat_model.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    DocumentReference? userRef,
    dynamic partnerUid,
    String? message,
    Timestamp? createdAt, 
  }) = _ChatState;
}
