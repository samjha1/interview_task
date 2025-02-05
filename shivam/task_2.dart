// Task 2 : Fix all the bugs in the code and run.
// // Time Duration : 30 minutes
import 'dart:async';

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  dynamic counter = "0";
  final StreamController<int> streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    counter++;
  }

  void _decrementCounter() {
    counter--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App with Stream"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Counter:",
            style: TextStyle(fontSize: 30),
          ),
          StreamBuilder<int>(
            stream: streamController.stream,
            builder: (context, snapshot) {
              return Text(
                snapshot.data.toString(),
                style: TextStyle(fontSize: 50),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Icon(Icons.add),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: _decrementCounter,
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
