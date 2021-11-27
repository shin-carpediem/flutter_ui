import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ui/models/login_model/login_model.dart';
import 'package:state_notifier/state_notifier.dart';

class LogInModel extends StateNotifier<LogInState> {
  LogInModel() : super(const LogInState());

  void startLoading() => state = state.copyWith(isLoading: true);
  void endLoading() => state = state.copyWith(isLoading: false);

  void setEmail(String email) => state = state.copyWith(email: email);
  void setPassword(String password) =>
      state = state.copyWith(password: password);

  Future<void> logIn() async {
    final String? email = state.email;
    final String? password = state.password;

    if (email != null && password != null) {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    }
  }
}

