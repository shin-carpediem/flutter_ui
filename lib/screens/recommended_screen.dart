// ignore_for_file: unused_element, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ui/core/util/tts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui/core/course_card_domain.dart';
import 'package:flutter_ui/models/course_card_modal/course_card_modal.dart';
import 'package:flutter_ui/screens/login_screen.dart';
import 'package:flutter_ui/screens/add_course_screen.dart';
import 'package:flutter_ui/screens/edit_course_modal.dart';
import 'package:flutter_ui/screens/my_page_screen.dart';

class Recommended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CourseCard>(builder: (context, model, child) {
          final dynamic user = FirebaseAuth.instance.currentUser;
          return Container(
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
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        if (user != null) {
                          final bool? added = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddCoursePage(),
                              fullscreenDialog: true,
                            ),
                          );

                          if (added != null && added) {
                            final snackBar = SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text('New course is added!'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }

                          model.fetchCourseCard();
                        } else {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogInPage(),
                              fullscreenDialog: true,
                            ),
                          );
                        }
                      },
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (user != null) {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyPageSheet(),
                              fullscreenDialog: true,
                            ),
                          );
                        } else {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogInPage(),
                              fullscreenDialog: true,
                            ),
                          );
                        }
                      },
                      icon: Icon(Icons.person),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
        Consumer<CourseCard>(builder: (context, model, child) {
          final List<CourseCardModel>? courseCards = model.courseCards;
          final dynamic user = FirebaseAuth.instance.currentUser;
          final dynamic uid = FirebaseAuth.instance.currentUser?.uid;

          if (courseCards == null) {
            return CircularProgressIndicator();
          }

          final List<Widget> widgets = courseCards
              .map((courseCard) => Card(
                    // draggableにするためには要素を
                    // 識別するkeyが必要
                    key: Key(courseCard.id),
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
                          child: GestureDetector(
                            onTap: () {
                              speakSlowly(courseCard.title.toString());
                              speak(courseCard.subtitle.toString());
                            },
                            child: Image.network(
                              courseCard.logoUrl,
                              fit: BoxFit.contain,
                              errorBuilder: (c, o, s) {
                                return Icon(
                                  Icons.error,
                                  color: Colors.red,
                                );
                              },
                            ),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(courseCard.title),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (user != null &&
                                    courseCard.favoriteList.contains(uid))
                                  IconButton(
                                    onPressed: () {
                                      model.changefavorite(
                                        courseCard,
                                        uid,
                                        courseCard.favoriteList,
                                      );
                                      model.fetchCourseCard();
                                    },
                                    icon: Icon(Icons.favorite),
                                    color: Colors.red,
                                    iconSize: 20,
                                  )
                                else if (user != null)
                                  IconButton(
                                    onPressed: () {
                                      model.changefavorite(
                                        courseCard,
                                        uid,
                                        courseCard.favoriteList,
                                      );
                                      model.fetchCourseCard();
                                    },
                                    icon: Icon(Icons.favorite_border),
                                    color: Colors.grey,
                                    iconSize: 20,
                                  ),
                                Text(
                                  courseCard.favoriteNum.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Text(courseCard.subtitle),
                        trailing: IconButton(
                          onPressed: () {
                            if (user != null) {
                              modalBottomSheet(
                                context,
                                courseCard,
                                model,
                                // courseCard.title,
                                // courseCard.subtitle,
                                // courseCard.logoUrl,
                              );
                            } else {
                              final snackBar = SnackBar(
                                content: Text('This menu requires your login.'),
                                backgroundColor: Colors.grey,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          icon: Icon(Icons.more_horiz),
                        ),
                      ),
                    ),
                  ))
              .toList();

          // TODO: Draggableになれていない
          return ReorderableListView(
            shrinkWrap: true,
            children: widgets,
            onReorder: (oldIndex, newIndex) {
              model.dragAndDrop(oldIndex, newIndex, courseCards);
            },
          );
        }),
      ],
    );
  }
}
