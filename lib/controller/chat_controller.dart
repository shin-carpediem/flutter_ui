import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/chat_model/chat_model.dart';
import 'package:state_notifier/state_notifier.dart';

class ChatController extends StateNotifier<ChatState> {
  ChatController() : super(const ChatState());

  final chatController = TextEditingController();

  void handleSubmit(String message) async {
    // void handleSubmit(String message, dynamic partnerUid) async {
    chatController.text = "";
    final dynamic uid = FirebaseAuth.instance.currentUser!.uid;
    final ref = FirebaseFirestore.instance.collection('users').doc(uid);
    // final snapshot =
    //     await ref.get();
    // final data = snapshot.data();
    await FirebaseFirestore.instance.collection('chat').add({
      'userRef': ref,
      // 'partnerUid': partnerUid,
      'partnerUid': "",
      'message': message,
      'created_at': DateTime.now(),
    }).then((value) {
      // for test
    }).catchError((e) {
      throw "error";
    });

    state = state.copyWith(
      userRef: ref,
      message: message,
    );
  }
}
