import 'package:flutter/material.dart';
import 'package:flutter_medical_crud/screens/screens.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.isLoggedIn(),
          builder: ((BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Text('Espere...');
            }

            // print("snapshot data = ${snapshot.data}");

            if (snapshot.data) {
              Future.microtask(() {
                // Esta linea es para evitar el Error en el setState() y dentro del builder
                // Navigator.of(context).pushReplacementNamed('home');
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (
                        _,
                        __,
                        ___,
                      ) =>
                          const HomeScreen(),
                      transitionDuration: const Duration(seconds: 0),
                    ));
              });
            } else {
              Future.microtask(() {
                // Esta linea es para evitar el Error en el setState() y dentro del builder
                // Navigator.of(context).pushReplacementNamed('home');
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (
                        _,
                        __,
                        ___,
                      ) =>
                          const LoginScreen(),
                      transitionDuration: const Duration(seconds: 0),
                    ));
              });
            }

            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,

                // backgroundColor: Colors.redAccent,
              ),
            );
          }),
        ),
      ),
    );
  }
}
