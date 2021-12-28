// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget message(String message, String name) {
  return Row(
    children: <Widget>[
      Icon(Icons.person),
      Padding(
          padding:
              EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0, bottom: 8.0)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10.0),
          Text(name),
          Text(message),
        ],
      ),
    ],
  );
}
