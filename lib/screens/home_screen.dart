import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Especialidades'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
              print('logout');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('HomeScreen UI'),
      ),
    );
  }
}
