import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
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

class SignUpModel extends StateNotifier<SignUpState> {
  // final String email;
  // final String password;
  // bool isLoading = false;

  SignUpModel() : super(const SignUpState());

  void startLoading() => state = state.copyWith(isLoading: true);
  void endLoading() => state = state.copyWith(isLoading: false);

  void setEmail(String email) => state = state.copyWith(email: email);
  void setPassword(String password) =>
      state = state.copyWith(password: password);

  Future<void> signUp() async {
    final String? email = state.email;
    final String? password = state.password;

    // if (email == null || email!.isEmpty) {
    //   throw 'email is not input.';
    // }

    // if (password == null || password!.isEmpty) {
    //   throw 'password is not input.';
    // }

    // if (email != null && password != null) {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    final user = userCredential.user;

    if (user != null) {
      final uid = user.uid;
      final doc = FirebaseFirestore.instance.collection('users').doc(uid);
      await doc.set({
        'uid': uid,
        'email': email,
      });
    }
    // }
  }
}

// class SignUpModel extends ChangeNotifier {
//   Future signUp() async {
//     if (email == null || email!.isEmpty) {
//       throw 'email is not input.';
//     }

//     if (password == null || password!.isEmpty) {
//       throw 'password is not input.';
//     }

//     if (email != null && password != null) {
//       final userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email!, password: password!);
//       final user = userCredential.user;

//       if (user != null) {
//         final uid = user.uid;

//         final doc = FirebaseFirestore.instance.collection('users').doc(uid);
//         await doc.set({
//           'uid': uid,
//           'email': email,
//         });
//       }
//     }
//   }
// }
