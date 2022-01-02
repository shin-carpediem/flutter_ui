// ignore_for_file: non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_ui/controller/add_course_controller.dart';
import 'package:flutter_ui/controller/app_theme_controller.dart';
import 'package:flutter_ui/controller/chat_controller.dart';
import 'package:flutter_ui/controller/course_card_controller.dart';
import 'package:flutter_ui/controller/edit_course_controller.dart';
import 'package:flutter_ui/controller/edit_profile_controller.dart';
import 'package:flutter_ui/controller/location_controller.dart';
import 'package:flutter_ui/controller/login_controller.dart';
import 'package:flutter_ui/controller/mypage_controller.dart';
import 'package:flutter_ui/controller/signup_controller.dart';
import 'package:flutter_ui/controller/tts_controller.dart';
import 'package:flutter_ui/models/add_course_model/add_course_model.dart';
import 'package:flutter_ui/models/app_theme_model/app_theme_model.dart';
import 'package:flutter_ui/models/chat_model/chat_model.dart';
import 'package:flutter_ui/models/chat_uesr_model/chat_user_model.dart';
import 'package:flutter_ui/models/course_card_model/course_card_model.dart';
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
final CourseCardProvider =
    StateNotifierProvider<CourseCardController, CourseCardState>(
        (ref) => CourseCardController());
final AddCourseProvider = StateNotifierProvider<AddCourseModel, AddCourseState>(
    (ref) => AddCourseModel());
final EditCourseProvider =
    StateNotifierProvider<EditCourseController, CourseCardState>(
        (ref) => EditCourseController());
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
final ChatProvider =
    StateNotifierProvider<ChatController, ChatState>((ref) => ChatController());

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeState = ref.watch(ThemeProvider);
    final ThemeController = ref.read(ThemeProvider.notifier);

    return provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider<ChatUser>(
            create: (ref) => ChatUser()..fetchChatUser()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter ui',
        theme: ThemeController.buildTheme(ThemeState.isDark),
        home: const Footer(),
      ),
    );
  }
}
