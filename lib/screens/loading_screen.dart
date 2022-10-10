import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Especialidades'),
      ),
      body: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
