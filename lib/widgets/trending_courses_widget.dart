// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, unused_element, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TrendingCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 32,
              bottom: 8,
              left: 8,
            ),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Trending Courses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    color: Colors.grey[100],
                    child: const ListTile(
                      leading: Icon(
                        Icons.school,
                        color: Colors.blue,
                      ),
                      trailing: Text('Communication Skills'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    color: Colors.grey[100],
                    child: const ListTile(
                      leading: Icon(
                        Icons.school,
                        color: Colors.blue,
                      ),
                      trailing: Text('Digital Marketing 101'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    color: Colors.grey[100],
                    child: const ListTile(
                      leading: Icon(
                        Icons.school,
                        color: Colors.blue,
                      ),
                      trailing: Text('UX Research'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                        child: const Text('View trending list'),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
