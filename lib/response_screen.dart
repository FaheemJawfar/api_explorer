import 'package:flutter/material.dart';

class ResponseScreen extends StatelessWidget {
  final String responseBody;

  const ResponseScreen({super.key, required this.responseBody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Response'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            responseBody,
            style: const TextStyle(fontFamily: 'Courier', fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}