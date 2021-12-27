import 'package:flutter/material.dart';
import 'package:flutter_ui/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Footer extends HookConsumerWidget {
  // final String title;
  // const Footer({
  //   Key? key,
  //   required this.title,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final ThemeState = ref.read(ThemeProvider);
    // final ThemeController = ref.read(ThemeProvider.notifier);

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
      ],
      // currentIndex: ,
      unselectedItemColor: Colors.blue[300],
      selectedItemColor: Colors.blue[700],
      // onTap: ,
    );
  }
}
