// ignore_for_file: unused_element, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/model/course_card_model.dart';
import 'package:flutter_ui/model/course_card.dart';
import 'package:flutter_ui/screen/courses_page/add_course_page.dart';
import 'package:flutter_ui/screen/courses_page/course_modal.dart';
import 'package:provider/provider.dart';

class Recommended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CourseCard>(
      create: (_) => CourseCard()..fetchCourseCard(),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 32, bottom: 8, left: 8),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCoursePage(),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Consumer<CourseCard>(builder: (context, model, child) {
            final List<CourseCardModel>? courseCards = model.courseCards;

            if (courseCards == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = courseCards
                .map((courseCard) => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: Container(
                            width: 48,
                            height: 48,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network(
                              courseCard.logoUrl,
                              fit: BoxFit.contain,
                            ),
                          ),
                          title: Text(courseCard.title),
                          subtitle: Text(courseCard.subtitle),
                          trailing: IconButton(
                            onPressed: () => modalBottomSheet(context),
                            icon: Icon(Icons.more_horiz),
                          ),
                        ),
                      ),
                    ))
                .toList();

            return ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: widgets,
            );
          }),
        ],
      ),
    );
  }
}
