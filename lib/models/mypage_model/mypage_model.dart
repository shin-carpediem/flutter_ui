import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'mypage_model.freezed.dart';

@freezed
class MyPageState with _$MyPageState {
  const factory MyPageState({
    String? name,
    String? email,
    String? desc,
    @Default(false) bool isLoading,
  }) = _MyPageState;
}

class MyPageModel extends StateNotifier<MyPageState> {
  MyPageModel() : super(const MyPageState());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final descController = TextEditingController();

  void startLoading() => state = state.copyWith(isLoading: true);
  void endLoading() => state = state.copyWith(isLoading: false);

  void fetchUser() async {
    final user = FirebaseAuth.instance.currentUser;

    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final data = snapshot.data();
    state = state.copyWith(
      email: user?.email,
      name: data?['name'],
      desc: data?['desc'],
    );
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
