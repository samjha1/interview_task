import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NoteEditor extends StatefulWidget {
  final User user;
  final QueryDocumentSnapshot? note;
  const NoteEditor({super.key, required this.user, this.note});

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!['title'];
      contentController.text = widget.note!['content'];
    }
  }

  void saveNote() async {
    if (titleController.text.isEmpty || contentController.text.isEmpty) return;

    if (widget.note == null) {
      await FirebaseFirestore.instance.collection('notes').add({
        'userId': widget.user.uid,
        'title': titleController.text,
        'content': contentController.text,
      });
    } else {
      await FirebaseFirestore.instance.collection('notes').doc(widget.note!.id).update({
        'title': titleController.text,
        'content': contentController.text,
      });
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.note == null ? 'New event' : 'Edit event')),
      body: Column(
        children: [
          TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Title')),
          TextField(controller: contentController, decoration: const InputDecoration(labelText: 'Content')),
          ElevatedButton(onPressed: saveNote, child: const Text('Save')),
        ],
      ),
    );
  }
}
