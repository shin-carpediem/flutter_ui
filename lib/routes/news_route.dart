// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          ListTile(title: Text("無駄")),
          ListTile(title: Text("無駄")),
        ],
      ),
    );
  }
}
