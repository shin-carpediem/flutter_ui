// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/model/edit_profile_model.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage(this.name, this.desc);
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditProfileModel>(
      create: (_) => EditProfileModel(
        name,
        desc,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit profile'),
        ),
        body: SafeArea(
          child: Consumer<EditProfileModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: model.nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                      ),
                      onChanged: (text) {
                        model.setName(text);
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: model.descController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "desc",
                      ),
                      onChanged: (text) {
                        model.setName(text);
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await model.update();
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
            );
          }),
        ),
      ),
    );
  }
}
