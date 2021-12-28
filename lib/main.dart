// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_field, non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_ui/controller/add_course_controller.dart';
import 'package:flutter_ui/controller/app_theme_controller.dart';
import 'package:flutter_ui/controller/edit_course_controller.dart';
import 'package:flutter_ui/controller/edit_profile_controller.dart';
import 'package:flutter_ui/controller/location_controller.dart';
import 'package:flutter_ui/controller/login_controller.dart';
import 'package:flutter_ui/controller/mypage_controller.dart';
import 'package:flutter_ui/controller/signup_controller.dart';
import 'package:flutter_ui/controller/tts_controller.dart';
import 'package:flutter_ui/models/add_course_model/add_course_model.dart';
import 'package:flutter_ui/models/app_theme_model/app_theme_model.dart';
import 'package:flutter_ui/models/course_card_modal/course_card_modal.dart';
import 'package:flutter_ui/models/course_title_modal/course_title_modal.dart';
import 'package:flutter_ui/models/edit_course_model/edit_course_model.dart';
import 'package:flutter_ui/models/edit_profile_model/edit_profile_model.dart';
import 'package:flutter_ui/models/location_model/location_model.dart';
import 'package:flutter_ui/models/login_model/login_model.dart';
import 'package:flutter_ui/models/mypage_model/mypage_model.dart';
import 'package:flutter_ui/models/signup_model/signup_model.dart';
import 'package:flutter_ui/models/tts_model/tts_model.dart';
import 'package:flutter_ui/widgets/footer_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as provider;

final ThemeProvider =
    StateNotifierProvider<AppTheme, AppThemeState>((ref) => AppTheme());
final AddCourseProvider = StateNotifierProvider<AddCourseModel, AddCourseState>(
    (ref) => AddCourseModel());
final EditCourseProvider =
    StateNotifierProvider<EditCourseModel, EditCourseState>(
        (ref) => EditCourseModel());
final LogInProvider =
    StateNotifierProvider<LogInModel, LogInState>((ref) => LogInModel());
final MyPageProvider = StateNotifierProvider<MyPageModel, MyPageState>(
    (ref) => MyPageModel()..fetchUser());
final SignUpProvider =
    StateNotifierProvider<SignUpModel, SignUpState>((ref) => SignUpModel());
final EditProfileProvider =
    StateNotifierProvider<EditProfileModel, EditProfileState>(
        (ref) => EditProfileModel());
final LocationProvider =
    StateNotifierProvider<LocationController, LocationState>(
        (ref) => LocationController());
final TtsProvider =
    StateNotifierProvider<TtsController, TtsState>((ref) => TtsController());

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// ignore: use_key_in_widget_constructors
class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeState = ref.watch(ThemeProvider);
    final ThemeController = ref.read(ThemeProvider.notifier);

    return provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider<CourseCard>(
            create: (ref) => CourseCard()..fetchCourseCard()),
        provider.ChangeNotifierProvider<CourseTitle>(
            create: (ref) => CourseTitle()..fetchCourseTitle()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter ui',
        theme: ThemeController.buildTheme(ThemeState.isDark),
        home: Footer(),
      ),
    );
  }
}
