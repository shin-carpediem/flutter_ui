import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ui/models/user_model/user_model.dart';
import 'package:state_notifier/state_notifier.dart';

class UserController extends StateNotifier<UserState> {
  UserController() : super(const UserState());

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
      iconUrl: data?['iconUrl'],
      companyRef: data?['companyRef'],
      companyId: data?['companyId'],
      companyName: data?['companyName'],
    );
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
