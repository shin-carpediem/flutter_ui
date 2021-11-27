// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_ui/controller/edit_profile_controller.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage(this.name, this.desc);
  final String? name;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: context.read<EditProfileModel>().nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name",
                  ),
                  onChanged: (text) {
                    context.read<EditProfileModel>().setName();
                  },
                ),
                SizedBox(height: 8),
                TextField(
                  controller: context.read<EditProfileModel>().descController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "desc",
                  ),
                  onChanged: (text) {
                    context.read<EditProfileModel>().setDesc();
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await context.read<EditProfileModel>().update();
                      Navigator.of(context).pop();
                    } catch (e) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(e.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text("Update"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
