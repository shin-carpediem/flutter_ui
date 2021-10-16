// import 'package:flutter_riverpod/flutter_riverpod.dart';

// rivorpodを使用してテーマの状態管理
// final themeModeProvider =
//     StateNotifierProvider<ThemeModeState, ThemeMode>((ref) {
//   return ThemeModeNotifier();
// });

// final indexProvider = Provider((ref) {
//   final ThemeMode themeMode = ref.watch(themeModeProvider);
//   return ThemeMode.values.indexOf(themeMode);
// });

// class ThemeModeNotifier extends StateNotifier<ThemeMode> {
//   ThemeModeNotifier() : super(ThemeMode.system);

//   void system() => state = ThemeMode.system;
//   void light() => state = ThemeMode.light;
//   void dark() => state = ThemeMode.dark;
// }
