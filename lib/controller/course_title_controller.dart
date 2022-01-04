import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// TODO: statenotifierに移行していない
class CourseTitleController extends ChangeNotifier {
  List<String> searchTargets = [];
  List<String> searchResults = [];

  final controller = TextEditingController();

  void fetchCourseTitle() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('courseCard').get();

    snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String title = data['title'];
      searchTargets.add(title);
    }).toList();

    notifyListeners();
  }

  Future search(String text) async {
    if (text.isEmpty) {
      searchResults.clear();
      notifyListeners();
      return;
    }

    final List<String> hitItems = searchTargets.where((input) {
      return input.toLowerCase().contains(text.toLowerCase());
    }).toList();

    searchResults = hitItems;
    notifyListeners();
  }
}
