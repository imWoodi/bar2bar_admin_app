import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toast {
  static void show({
    required String title,
    required String message,
    bool isError = false,
  }) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? Colors.red : Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
      icon: Icon(
        isError ? Icons.error_outline : Icons.check_circle_outline,
        color: Colors.white,
      ),
      shouldIconPulse: false,
      barBlur: 10,
      overlayBlur: 0,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      maxWidth: 400,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
} 