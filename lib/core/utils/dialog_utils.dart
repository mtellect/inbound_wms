import 'package:flutter/material.dart';

class DialogUtils {
  /// Shows a custom dialog in the application.
  static Future<T?> showDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Dismiss Dialog',
      pageBuilder: (context, animation, secondaryAnimation) {
        return builder(context);
      },
    );
  }
}
