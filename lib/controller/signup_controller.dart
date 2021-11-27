import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ui/models/signup_model/signup_model.dart';
import 'package:state_notifier/state_notifier.dart';

class SignUpModel extends StateNotifier<SignUpState> {
  SignUpModel() : super(const SignUpState());

  void startLoading() => state = state.copyWith(isLoading: true);
  void endLoading() => state = state.copyWith(isLoading: false);

  void setEmail(String email) => state = state.copyWith(email: email);
  void setPassword(String password) =>
      state = state.copyWith(password: password);

  Future<void> signUp() async {
    final String? email = state.email;
    final String? password = state.password;

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
  }
}
