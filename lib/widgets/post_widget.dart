// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_ui/core/util/tts.dart';
import 'package:flutter_ui/screens/course_content_screen.dart';
import 'package:flutter_ui/screens/edit_course_modal.dart';

Widget PostWidget(
  CourseCardState,
  CourseCardController,
  editCourseController,
  user,
  uid,
  context,
  doc,
  title,
) {
  return Card(
    // draggableにするためには要素を
    // 識別するkeyが必要
    // key: key,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onTap: () {
              speakSlowly(doc['title'].toString());
              speak(doc['subtitle'].toString());
            },
            child: Image.network(
              doc['logoUrl'],
              fit: BoxFit.contain,
              errorBuilder: (c, o, s) {
                return const Icon(
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoviePlayerScreen(doc['movieUrl']),
                    // builder: (context) => MoviePlayerScreen(),
                  ),
                );
              },
              child: Text(doc['title']),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (user != null && doc['favoriteList'].contains(uid))
                  IconButton(
                    onPressed: () {
                      CourseCardController.changefavorite(
                        doc.id,
                        uid,
                        doc['favoriteList'],
                      );
                    },
                    icon: const Icon(Icons.favorite),
                    color: Colors.red,
                    iconSize: 20,
                  )
                else if (user != null)
                  IconButton(
                    onPressed: () {
                      CourseCardController.changefavorite(
                        doc.id,
                        uid,
                        doc['favoriteList'],
                      );
                    },
                    icon: const Icon(Icons.favorite_border),
                    color: Colors.grey,
                    iconSize: 20,
                  ),
                Text(
                  doc['favoriteNum'].toString(),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        subtitle: Text(doc['subtitle']),
        trailing: title == "Your Posted Courses"
            ? IconButton(
                onPressed: () {
                  if (user != null) {
                    modalBottomSheet(
                      CourseCardState,
                      CourseCardController,
                      editCourseController,
                      context,
                      doc,
                    );
                  } else {
                    const snackBar = SnackBar(
                      content: Text('This menu requires your login.'),
                      backgroundColor: Colors.grey,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                icon: const Icon(Icons.more_horiz),
              )
            : null,
      ),
    ),
  );
}
