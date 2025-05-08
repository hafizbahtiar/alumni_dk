import 'package:flutter/material.dart';

class MySnackBar {
  static void showSuccess(BuildContext context, String message, {Duration? duration}) {
    _showSnackBar(context, message, Colors.green, Icons.check_circle, duration);
  }

  static void showError(BuildContext context, String message, {Duration? duration}) {
    _showSnackBar(context, message, Colors.red, Icons.error, duration);
  }

  static void showInfo(BuildContext context, String message, {Duration? duration}) {
    _showSnackBar(context, message, Colors.blue, Icons.info_outline, duration);
  }

  static void showWarning(BuildContext context, String message, {Duration? duration}) {
    _showSnackBar(context, message, Colors.orange, Icons.warning_amber_rounded, duration);
  }

  static void _showSnackBar(
    BuildContext context,
    String message,
    Color backgroundColor,
    IconData icon, [
    Duration? duration,
  ]) {
    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      duration: duration ?? const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      showCloseIcon: true,
      content: Row(
        spacing: 8.0,
        children: [
          Icon(icon, color: Colors.white),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).clearSnackBars(); // optional: avoid stacking
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
