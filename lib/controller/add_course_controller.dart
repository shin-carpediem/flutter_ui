import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_ui/models/add_course_model/add_course_model.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddCourseModel extends StateNotifier<AddCourseState> {
  AddCourseModel() : super(const AddCourseState());
  String? title;
  String? subtitle;
  String? logoUrl;
  String? movieUrl;

  Future addCourse() async {
    if (title == null || title!.isEmpty) {
      throw 'Title is not input.';
    }

    if (subtitle == null || subtitle!.isEmpty) {
      throw 'subtitle is not input.';
    }

    if (logoUrl == null || logoUrl!.isEmpty) {
      throw 'logo is not input.';
    }

    if (title!.length >= 15) {
      throw 'Title can be less than 15 letters';
    }

    if (subtitle!.length >= 30) {
      throw 'Subtitle can be less than 30 letters';
    }

    await FirebaseFirestore.instance.collection('courseCard').add({
      'title': title,
      'subtitle': subtitle,
      'logoUrl': logoUrl,
      'movieUrl': "",
      'favoriteList': [],
      'favoriteNum': 0,
    });
  }

  Future addMovie(final courseId) async {
    XFile? pickerFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickerFile != null) {
      File file = File(pickerFile.path);
      FirebaseStorage storage = FirebaseStorage.instance;
      final storageRef = storage.ref().child('PostVideo/');
      try {
        await storageRef.putFile(file);
        await storageRef.getDownloadURL().then((fileUrl) => {
              movieUrl = fileUrl,
            });
      } catch (e) {
        throw "error while uploading movie.";
      }
    }

    await FirebaseFirestore.instance
        .collection('courseCard')
        // TODO: courseCard毎に動画の追加のため、courseCardのIDを取得できるようにする
        // .doc(courseId)
        .doc('h0Eran6Dks8Avrif5IDz')
        .update({
      'movieUrl': movieUrl,
    });
  }
}
