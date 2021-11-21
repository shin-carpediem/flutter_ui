// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/highlighted_text_widget.dart';

class BrowsCourseScreen extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<BrowsCourseScreen> {
  late TextEditingController controller;
  bool isCaseSensitive = false;

  final List<String> searchTargets =
      List.generate(10, (index) => 'Something ${index + 1}');

  List<String> searchResults = [];

  void search(String query, {bool isCaseSensitive = false}) {
    if (query.isEmpty) {
      setState(() {
        searchResults.clear();
      });
      return;
    }

    final List<String> hitItems = searchTargets.where((element) {
      return element.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      searchResults = hitItems;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Items'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Enter keyword'),
              onChanged: (String val) {
                search(val);
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: HighlightedText(
                    wholeString: searchResults[index],
                    highlightedString: controller.text,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
