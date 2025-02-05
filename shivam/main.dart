import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:interview_task/auth_screen.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event management App',
      home: const AuthScreen(),
    );
  }
}
