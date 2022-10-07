import 'package:flutter/material.dart';
import 'package:flutter_medical_crud/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: AuthBackground(
      child: SizedBox(
        width: double.infinity,
        height: 300,
      ),
    ));
  }
}
