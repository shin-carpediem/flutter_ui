// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/models/login_model.dart';
import 'package:flutter_ui/screens/signup_screen.dart';
import 'package:flutter_ui/screens/reset_password_screen.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LogInModel>(
      create: (_) => LogInModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Log In'),
        ),
        body: SafeArea(
          child: Consumer<LogInModel>(builder: (context, model, child) {
            return Padding(
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
                        model.email = text;
                      },
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                      onChanged: (text) {
                        model.password = text;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await model.logIn();
                          Navigator.of(context).pop(true);
                        } catch (e) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text("Log In"),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Didn't you registered yet?",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ResetPasswordPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Reset password",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
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
