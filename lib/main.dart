// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_field

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_ui/controller/add_course_controller.dart';
import 'package:flutter_ui/controller/edit_course_controller.dart';
import 'package:flutter_ui/controller/edit_profile_controller.dart';
import 'package:flutter_ui/controller/login_controller.dart';
import 'package:flutter_ui/controller/mypage_controller.dart';
import 'package:flutter_ui/controller/signup_controller.dart';
import 'package:flutter_ui/models/add_course_model/add_course_model.dart';
import 'package:flutter_ui/models/app_theme_model/app_theme_model.dart';
import 'package:flutter_ui/models/course_card_modal/course_card_modal.dart';
import 'package:flutter_ui/models/course_title_modal/course_title_modal.dart';
import 'package:flutter_ui/models/edit_course_model/edit_course_model.dart';
import 'package:flutter_ui/models/edit_profile_model/edit_profile_model.dart';
import 'package:flutter_ui/models/login_model/login_model.dart';
import 'package:flutter_ui/models/mypage_model/mypage_model.dart';
import 'package:flutter_ui/models/signup_model/signup_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui/screens/top_page.dart';
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
        ChangeNotifierProvider<CourseTitle>(
            create: (context) => CourseTitle()..fetchCourseTitle()),
        StateNotifierProvider<AddCourseModel, AddCourseState>(create: (context) => AddCourseModel()),
        StateNotifierProvider<EditCourseModel, EditCourseState>(create: (context) => EditCourseModel()),
        StateNotifierProvider<LogInModel, LogInState>(create: (context) => LogInModel()),
        StateNotifierProvider<MyPageModel, MyPageState>(
            create: (context) => MyPageModel()..fetchUser()),
        StateNotifierProvider<SignUpModel, SignUpState>(create: (context) => SignUpModel()),
        StateNotifierProvider<EditProfileModel, EditProfileState>(create: (context) => EditProfileModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter ui',
        theme: Provider.of<AppTheme>(context).buildTheme(),
        home: TopPage(),
      ),
    );
  }
}
