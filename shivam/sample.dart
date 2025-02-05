import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview_task/addnote.dart';
import 'package:interview_task/auth_screen.dart';
import 'package:interview_task/event.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My event'),
        actions: [
          IconButton(
              onPressed: () => signOut(context),
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: const NotesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddNoteScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
