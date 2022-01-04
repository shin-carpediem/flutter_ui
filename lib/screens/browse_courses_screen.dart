import 'package:flutter/material.dart';
import 'package:flutter_ui/controller/course_title_controller.dart';
import 'package:flutter_ui/widgets/highlighted_text_widget.dart';
import 'package:provider/provider.dart';

class BrowsCourseScreen extends StatelessWidget {
  const BrowsCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Items'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Consumer<CourseTitleController>(builder: (context, model, child) {
          return Column(
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'Enter keyword'),
                onChanged: (String text) {
                  model.search(text);
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
