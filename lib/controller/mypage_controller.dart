import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ui/models/mypage_model/mypage_model.dart';
import 'package:state_notifier/state_notifier.dart';

class MyPageModel extends StateNotifier<MyPageState> {
  MyPageModel() : super(const MyPageState());

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
      iconUrl: data?['icon'],
    );
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
