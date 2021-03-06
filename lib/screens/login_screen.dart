// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/main.dart';
import 'package:flutter_ui/screens/signup_screen.dart';
import 'package:flutter_ui/screens/reset_password_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogInPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.read(LogInProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                  ),
                  onChanged: (text) {
                    loginController.setEmail(text);
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                  ),
                  onChanged: (text) {
                    loginController.setPassword(text);
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await loginController.logIn();
                      Navigator.of(context)
                        ..pop(true)
                        ..pop(true);
                    } catch (e) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(e.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text("Log In"),
                ),
                const SizedBox(height: 16),
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
                  child: const Text(
                    "Didn't you registered yet?",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
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
                  child: const Text(
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
        ),
      ),
    );
  }
}
