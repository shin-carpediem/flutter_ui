import 'package:flutter/material.dart';

Widget message(String message) {
  return Row(
    children: <Widget>[
      const Icon(Icons.person),
      const Padding(
          padding:
              EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0, bottom: 8.0)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10.0),
          // Text(name),
          Text(message),
        ],
      ),
    ],
  );
}
