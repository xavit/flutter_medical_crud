import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackbar(String message) {
    messengerKey.currentState!.showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
