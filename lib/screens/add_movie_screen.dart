// ignore_for_file:, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddMovieScreen extends HookConsumerWidget {
  const AddMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addCourseController = ref.read(AddCourseProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Movie'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('courseCard')
                    .snapshots(),
                builder: (context, snapshot) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            await addCourseController
                                // TODO: courseCardのIDを取得できるようにする
                                .addMovie("h0Eran6Dks8Avrif5IDz");
                            Navigator.of(context)
                              ..pop(true)
                              ..pop(true);
                            const snackBar = SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text("Movie has successfully uploaded."),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } catch (e) {
                            final snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(e.toString()),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: const Text("Upload"),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
