// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
// import 'package:flutter_ui/models/app_theme_model/app_theme_model.dart';
// import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<AppTheme>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 80,
        ),
        // Switch.adaptive(
        //   value: theme.isDark,
        //   onChanged: (_) {
        //     theme.changeMode();
        //   },
        // ),
      ],
    );
  }
}
