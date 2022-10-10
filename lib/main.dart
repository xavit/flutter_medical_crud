import 'package:flutter/material.dart';
import 'package:flutter_medical_crud/screens/screens.dart';
import 'package:provider/provider.dart';

import 'services/services.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (_) => SpecialtiesService(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: NotificationsService.messengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'check',
      routes: {
        'check': (_) => const CheckAuthScreen(),
        'home': (_) => const HomeScreen(),
        'login': (_) => const LoginScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
    );
  }
}
