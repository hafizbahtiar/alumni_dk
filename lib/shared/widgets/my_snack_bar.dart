import 'package:flutter/material.dart';

enum SnackBarType { success, error, info, warning }

class MySnackBar {
  static void show(
    BuildContext context,
    String message, {
    required SnackBarType type,
    Duration duration = const Duration(seconds: 3),
  }) {
    final config = _getConfig(type);

    final snackBar = SnackBar(
      backgroundColor: config.color,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      showCloseIcon: true,
      content: Row(
        children: [
          Icon(config.icon, color: Colors.white),
          const SizedBox(width: 8),
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

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(snackBar);
  }

  static _SnackBarConfig _getConfig(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return _SnackBarConfig(Colors.green, Icons.check_circle);
      case SnackBarType.error:
        return _SnackBarConfig(Colors.red, Icons.error);
      case SnackBarType.info:
        return _SnackBarConfig(Colors.blue, Icons.info_outline);
      case SnackBarType.warning:
        return _SnackBarConfig(Colors.orange, Icons.warning_amber_rounded);
    }
  }
}

class _SnackBarConfig {
  final Color color;
  final IconData icon;

  const _SnackBarConfig(this.color, this.icon);
}
