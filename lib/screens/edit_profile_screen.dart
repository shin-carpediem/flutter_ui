// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_ui/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditProfilePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editProfilecontroller = ref.read(EditProfileProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      // TODO: something wrong
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: editProfilecontroller.nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name",
                  ),
                  onChanged: (text) {
                    editProfilecontroller.setName();
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: editProfilecontroller.descController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "desc",
                  ),
                  onChanged: (text) {
                    editProfilecontroller.setDesc();
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await editProfilecontroller.update();
                      Navigator.of(context).pop();
                    } catch (e) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(e.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text("Update"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
