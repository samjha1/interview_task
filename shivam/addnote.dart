import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNoteScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void saveNote(BuildContext context) {
    FirebaseFirestore.instance.collection('notes').add({
      'title': titleController.text,
      'content': contentController.text,
      'timestamp': FieldValue.serverTimestamp(),
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title')),
              TextField(
                  controller: contentController,
                  decoration: const InputDecoration(labelText: 'Content')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => saveNote(context),
                  child: const Text('Save Note')),
            ],
          ),
        ),
      ),
    );
  }
}
