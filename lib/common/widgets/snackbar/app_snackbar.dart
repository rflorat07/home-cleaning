import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class AppSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black87,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(message, style: const TextStyle(color: Colors.white)),
          backgroundColor: backgroundColor,
          duration: duration,
          action: action,
        ),
      );
  }

  static void success(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: TColors.success,
    );
  }

  static void error(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: TColors.error,
    );
  }

  static void warning(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: TColors.warning,
    );
  }

  static void info(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: TColors.info,
    );
  }
}
