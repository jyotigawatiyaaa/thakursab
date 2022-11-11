
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showSnackBar({required String value, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content: Text(value,style: const TextStyle(color: Colors.white)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
