// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/util/launch.dart';
import 'package:flutter_ui/main.dart';
import 'package:flutter_ui/screens/edit_profile_screen.dart';
import 'package:flutter_ui/screens/google_map_screen.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageSheet extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MypageState = ref.watch(MyPageProvider);
    final Mypagecontroller = ref.read(MyPageProvider.notifier);
    final LocationState = ref.watch(LocationProvider);
    final LocationController = ref.read(LocationProvider.notifier);
    final TtsState = ref.watch(TtsProvider);
    final TtsController = ref.read(TtsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('My page'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(
                    MypageState.name,
                    MypageState.desc,
                  ),
                ),
              );
              Mypagecontroller.fetchUser();
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          ref.watch(MyPageProvider.select(
                              (state) => state.name ?? 'No name')),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CircleAvatar(
                          child: Image.network(
                            ref.watch(MyPageProvider.select(
                                (state) => state.iconUrl ?? '')),
                            fit: BoxFit.contain,
                            errorBuilder: (c, o, s) {
                              return Icon(
                                Icons.error,
                                color: Colors.grey,
                              );
                            },
                          ),
                          backgroundColor: Colors.blue[100],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      ref.watch(MyPageProvider.select(
                          (state) => state.email ?? 'No email')),
                    ),
                    SizedBox(height: 8),
                    Text(
                      ref.watch(MyPageProvider.select(
                          (state) => state.desc ?? 'No desc')),
                    ),
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
                        await Mypagecontroller.logout();
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
                      onPressed: () {
                        LocationController.determinePosition();
                      },
                      child: Text("Get your location."),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Your location is  " + LocationState.location,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          "Speech to Text",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('LastWords:  ' + TtsState.lastWords),
                        // Text('States:  ' + TtsState.lastStatus),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (MypageState.isLoading)
              Container(
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: AvatarGlow(
        animate: TtsState.isListen,
        glowColor: Colors.blue,
        endRadius: 65.0,
        duration: Duration(milliseconds: 2000),
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
            child: Icon(TtsState.isListen ? Icons.mic : Icons.mic_none),
            onPressed: () {
              TtsState.isListen ? TtsController.stop() : TtsController.speak();
            }),
      ),
    );
  }
}
