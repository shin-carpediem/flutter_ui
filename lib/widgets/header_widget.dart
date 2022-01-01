// ignore_for_file: prefer_const_constructors, unused_element, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_ui/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Header extends HookConsumerWidget {
  final String title;
  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeState = ref.read(ThemeProvider);
    final ThemeController = ref.read(ThemeProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Switch.adaptive(
          value: ThemeState.isDark,
          onChanged: (_) {
            ThemeController.changeMode();
          },
        ),
      ],
    );
  }
}
