// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/core/util/launch.dart';
import 'package:flutter_ui/screen/edit_profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui/model/mypage_model.dart';

class MyPageSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyPageModel>(
      create: (_) => MyPageModel()..fetchUser(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('My page'),
          actions: [
            Consumer<MyPageModel>(builder: (context, model, child) {
              return IconButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                        model.name!,
                        model.desc!,
                      ),
                    ),
                  );
                  model.fetchUser();
                },
                icon: Icon(Icons.edit),
              );
            })
          ],
        ),
        body: Center(
          child: Consumer<MyPageModel>(builder: (context, model, child) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          model.name ?? 'No name',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(model.email ?? 'No email'),
                        SizedBox(height: 8),
                        Text(model.desc ?? 'No desc'),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: () => launchGitHub(),
                          child: Text(
                            'See the source code of this app',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextButton(
                          onPressed: () async {
                            await model.logout();
                            Navigator.of(context).pop();
                          },
                          child: Text('Log out'),
                        ),
                      ],
                    ),
                  ),
                ),
                if (model.isLoading)
                  Container(
                    color: Colors.black54,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
