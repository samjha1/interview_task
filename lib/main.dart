// Flutter Interview Task with Firebase Integration and Getx
// Task Overview:
// The task is to build a simple Flutter app that integrates with Firebase for authentication and event management. The developer should use Getx for state management to handle the state of the authentication and event data.
// The app will consist of:
// 1. Authentication (Signup and Login with email and pass) via Firebase Authentication.
// 2. Event Management:
// * Create: A screen to add new events with a title, description, and image.
// * Update: Ability to update event details.
// * Delete: Ability to delete an event.
// * View: A screen to display all the created events in a list.
//
// Requirements:
// 1. Firebase Setup:
// •  Firebase Authentication for Signup and Login.
// •  Firebase Firestore for storing event data (title, description, and image URL).
// •  Firebase Storage for storing event images.
// 2. GetX State Management:
// •  Use GetX for managing authentication and event data.
// •  Authentication state (Logged in / Logged out).
// •  Event state (events list, selected event for updating).
// Time Duration : 1 hour 30 minutes

import 'package:flutter/material.dart';
import 'package:interview_task/task_1.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MyEventApp();
  }
}
