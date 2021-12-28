import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/chat_model/chat_model.dart';
import 'package:state_notifier/state_notifier.dart';

class ChatController extends StateNotifier<ChatState> {
  ChatController() : super(const ChatState());

  final chatController = TextEditingController();

  void handleSubmit(String message) async {
    chatController.text = "";
    final dynamic uid = FirebaseAuth.instance.currentUser!.uid;
    final snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final data = snapshot.data();
    await FirebaseFirestore.instance.collection('chat').add({
      'name': data?['name'],
      'message': message,
      'created_at': DateTime.now(),
    }).then((value) {
      // for test
    }).catchError((e) {
      throw "error";
    });

    state = state.copyWith(
      name: data?['name'],
      message: data?['message'],
      createdAt: data?['created_at'],
    );
  }
}
