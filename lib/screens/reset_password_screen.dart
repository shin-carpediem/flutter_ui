// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/screens/recommended_screen.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset password'),
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                  ),
                  onChanged: (text) {
                    email = text;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (email != null) {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: email!,
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Recommended();
                          },
                        ),
                      );
                    } else {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.grey,
                        content: Text('Please input your email.'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text("Reset password"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
