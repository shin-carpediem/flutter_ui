// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/controller/mypage_controller.dart';
import 'package:flutter_ui/core/util/launch.dart';
import 'package:flutter_ui/screens/edit_profile_screen.dart';
import 'package:flutter_ui/screens/google_map_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_ui/models/mypage_model/mypage_model.dart';

class MyPageSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My page'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(),
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      // TODO: データを表示させる
                      context.select<MyPageState, String>(
                          (state) => state.name ?? 'No name'),
                      // context.select<MyPageState, String>(
                      //     (state) => state.name ?? 'No name'),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(context.select<MyPageState, String>(
                        (state) => state.email ?? 'No email')),
                    SizedBox(height: 8),
                    Text(context.select<MyPageState, String>(
                        (state) => state.desc ?? 'No desc')),
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
                        await context.read<MyPageModel>().logout();
                        Navigator.of(context).pop();
                      },
                      child: Text('Log out'),
                    ),
                    TextButton(
                      onPressed: () {
                        DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          minTime: DateTime(2021, 4, 1),
                          maxTime: DateTime(2025, 3, 31),
                          // onChanged: (date) {
                          //   print('change $date');
                          // },
                          // onConfirm: (date) {
                          //   print('confirm $date');
                          // },
                          currentTime: DateTime.now(),
                          locale: LocaleType.zh,
                        );
                      },
                      child: Text("Choose DateTime."),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return MapScreen();
                            },
                          ),
                        );
                      },
                      child: Text("Open Google map"),
                    ),
                  ],
                ),
              ),
            ),
            if (context.read<MyPageState>().isLoading)
              Container(
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
