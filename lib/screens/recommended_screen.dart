// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ui/main.dart';
import 'package:flutter_ui/widgets/recommended_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_ui/screens/login_screen.dart';
import 'package:flutter_ui/screens/add_course_screen.dart';
import 'package:flutter_ui/screens/my_page_screen.dart';

class Recommended extends HookConsumerWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CourseCardState = ref.watch(CourseCardProvider);
    final CourseCardController = ref.read(CourseCardProvider.notifier);
    final editCourseController = ref.read(EditCourseProvider.notifier);
    final dynamic user = FirebaseAuth.instance.currentUser;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('courseCard').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        final dynamic uid = user?.uid;
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 32, bottom: 8, left: 8),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
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
                              const snackBar = SnackBar(
                                backgroundColor: Colors.blue,
                                content: Text('New course is added!'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
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
                        icon: const Icon(Icons.add),
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
                        icon: const Icon(Icons.person),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // TODO: keyをどうやったら保有させられるか
            // ReorderableListView.builder(
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];
                return recommendedWidget(
                  CourseCardState,
                  CourseCardController,
                  editCourseController,
                  user,
                  uid,
                  context,
                  doc,
                );
              },
              itemCount: snapshot.data!.docs.length,
              // onReorder: (oldIndex, newIndex) {
              //   CourseCardController.dragAndDrop(
              //       oldIndex, newIndex, snapshot.data!.docs);
              // },
            ),
          ],
        );
      },
    );
  }
}
