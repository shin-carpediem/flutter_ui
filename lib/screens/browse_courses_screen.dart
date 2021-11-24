// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_ui/models/course_title_modal/course_title_modal.dart';
import 'package:flutter_ui/widgets/highlighted_text_widget.dart';
import 'package:provider/provider.dart';

class BrowsCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Items'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Consumer<CourseTitle>(builder: (context, model, child) {
          return Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Enter keyword'),
                onChanged: (String text) {
                  model.search(text);
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: model.searchResults.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: HighlightedText(
                      wholeString: model.searchResults[index],
                    ),
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
