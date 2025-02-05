import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/authentication.dart';
import 'package:interview_task/home.dart';
import 'package:interview_task/signupscreen.dart';

class loginscreen extends StatelessWidget {
  final AuthenticationController _authController =
      Get.put(AuthenticationController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                await _authController.login(
                  _emailController.text,
                  _passwordController.text,
                );
                if (_authController.isSignedIn) {
                  Get.offAll(homescreen());
                }
              },
              child: Text("Login"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(Signupscreen());
              },
              child: Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}
