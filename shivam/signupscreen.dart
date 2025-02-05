import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/authentication.dart';

class Signupscreen extends StatelessWidget {
  final AuthenticationController _authController = Get.find();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _authController.signup(
                  _emailController.text,
                  _passwordController.text,
                );
                if (_authController.isSignedIn) {
                  Get.back();
                }
              },
              child: Text("signup"),
            ),
          ],
        ),
      ),
    );
  }
}
