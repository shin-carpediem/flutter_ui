// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';

class IconLogo extends StatelessWidget {
  final double size;
  final String url;

  const IconLogo({
    Key? key,
    required this.size,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(8),
        color: Colors.black,
        child: Image.network(
          url,
          fit: BoxFit.contain,
          errorBuilder: (c, o, s) {
            return Icon(
              Icons.error,
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
