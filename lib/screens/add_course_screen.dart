import 'package:flutter/material.dart';
import 'package:flutter_ui/main.dart';
import 'package:flutter_ui/screens/add_movie_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddCoursePage extends HookConsumerWidget {
  const AddCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addCourseController = ref.read(AddCourseProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Course'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Logo",
                  ),
                  onChanged: (text) {
                    addCourseController.logoUrl = text;
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                  ),
                  onChanged: (text) {
                    addCourseController.title = text;
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Subtitle",
                  ),
                  onChanged: (text) {
                    addCourseController.subtitle = text;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await addCourseController.addCourse();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddMovieScreen(),
                          fullscreenDialog: true,
                        ),
                      );
                    } catch (e) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(e.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
