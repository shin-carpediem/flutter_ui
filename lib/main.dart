// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_field

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
// import 'package:flutter_ui/core/course_card_domain.dart';
import 'package:flutter_ui/models/add_course_model/add_course_model.dart';
import 'package:flutter_ui/models/app_theme_model/app_theme_model.dart';
import 'package:flutter_ui/models/course_card_modal/course_card_modal.dart';
import 'package:flutter_ui/models/course_title_modal/course_title_modal.dart';
// import 'package:flutter_ui/models/edit_course_model.dart';
// import 'package:flutter_ui/models/edit_profile_model.dart';
import 'package:flutter_ui/models/login_model/login_model.dart';
import 'package:flutter_ui/models/mypage_model/mypage_model.dart';
import 'package:flutter_ui/models/signup_model/signup_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui/screens/top_page.dart';
// import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CourseCard>(
            create: (context) => CourseCard()..fetchCourseCard()),
        ChangeNotifierProvider<AddCourseModel>(create: (context) => AddCourseModel()),
        ChangeNotifierProvider<CourseTitle>(
            create: (context) => CourseTitle()..fetchCourseTitle()),
        // ChangeNotifierProvider<EditCourseModel>(create: (context) => EditCourseModel()),
        // ChangeNotifierProvider<EditProfileModel>(create: (context) => EditProfileModel()),
        StateNotifierProvider<LogInModel, LogInState>(create: (context) => LogInModel()),
        ChangeNotifierProvider<MyPageModel>(
            create: (context) => MyPageModel()..fetchUser()),
        StateNotifierProvider<SignUpModel, SignUpState>(create: (context) => SignUpModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Provider.of<AppTheme>(context).buildTheme(),
        home: TopPage(),
      ),
    );
  }
}
