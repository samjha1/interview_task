import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/authentication.dart';

class homescreen extends StatelessWidget {
  final _authController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _authController.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Text("Welcome to Home Screen"),
      ),
    );
  }
}
