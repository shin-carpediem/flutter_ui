import 'package:flutter/material.dart';

Widget ownMessage(String message) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10.0),
          // Text(name),
          Text(message),
        ],
      ),
      const Padding(
          padding:
              EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0, bottom: 8.0)),
      const Icon(Icons.person),
    ],
  );
}
