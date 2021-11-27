import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/edit_profile_model/edit_profile_model.dart';
import 'package:state_notifier/state_notifier.dart';

class EditProfileModel extends StateNotifier<EditProfileState> {
  EditProfileModel() : super(const EditProfileState());

  final nameController = TextEditingController();
  final descController = TextEditingController();

  void setName() => state = state.copyWith(name: nameController.text);
  void setDesc() => state = state.copyWith(desc: descController.text);

  bool isUpdated(name, desc) {
    return name != null || desc != null;
  }

  Future update() async {
    String name = nameController.text;
    String desc = descController.text;

    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'name': name,
      'desc': desc,
    });
  }
}
