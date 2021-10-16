// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui/app_theme.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui/top_page/top_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppTheme(),
      child: MyApp(),
    ),
  );
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final ThemeMode themeMode = watch(themeModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<AppTheme>(context).buildTheme(),
      home: TopPage(),
    );
  }
}
