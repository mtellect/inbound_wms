import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

/// Utility class for showing toast notifications using the toastification plugin
class ToastUtils {
  static ToastificationItem? toastificationItem;

  /// Shows a success toast notification
  static void showSuccess(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
    Alignment? alignment,
  }) {
    toastification.dismissAll();

    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text(title ?? 'Success'),
      description: Text(message),
      autoCloseDuration: duration ?? const Duration(seconds: 5),
      alignment: alignment ?? Alignment.topCenter,
      foregroundColor: Colors.green[900],
    );
  }

  /// Shows an error toast notification
  static void showError(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
    Alignment? alignment,
  }) {
    toastification.dismissAll();

    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(title ?? 'Error'),
      description: Text(message),
      autoCloseDuration: duration ?? const Duration(seconds: 5),
      alignment: alignment ?? Alignment.topCenter,
      foregroundColor: Colors.red[900],
      icon: const Icon(Icons.error),
    );
  }

  /// Shows a warning toast notification
  static void showWarning(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.flatColored,
      title: Text(title ?? 'Warning'),
      description: Text(message),
      autoCloseDuration: duration ?? const Duration(seconds: 4),
    );
  }

  /// Shows an info toast notification
  static void showInfo(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      title: Text(title ?? 'Info'),
      description: Text(message),
      autoCloseDuration: duration ?? const Duration(seconds: 4),
    );
  }

  /// Shows a custom toast notification
  static void showCustom(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
    ToastificationType type = ToastificationType.info,
    Color? backgroundColor,
    Color? foregroundColor,
    Icon? icon,
    AlignmentGeometry? alignment = Alignment.topRight,
  }) {
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.flatColored,
      title: title != null ? Text(title) : null,
      description: Text(message),
      autoCloseDuration: duration ?? const Duration(seconds: 4),
      backgroundColor: backgroundColor ?? Colors.grey,
      foregroundColor: foregroundColor ?? Colors.white,
      icon: icon,
      alignment: alignment,
    );
  }

  /// Shows a loading toast notification (doesn't auto-close)
  static void showLoading(
    BuildContext context, {
    required String message,
    String? title,
    ToastificationType type = ToastificationType.info,
  }) {
    toastificationItem = toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.flatColored,
      title: title != null ? Text(title) : null,
      description: Text(message),
      autoCloseDuration: null, // No auto-close for loading
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      icon: const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  /// Shows a toast for network error
  static void showNetworkError(
    BuildContext context, {
    String? message,
    String? title,
  }) {
    showError(
      context,
      message: message ?? 'Network connection error. Please check your internet connection.',
      title: title ?? 'Network Error',
    );
  }

  /// Shows a toast for server error
  static void showServerError(
    BuildContext context, {
    String? message,
    String? title,
  }) {
    showError(
      context,
      message: message ?? 'Server error occurred. Please try again later.',
      title: title ?? 'Server Error',
    );
  }

  /// Shows a toast for validation error
  static void showValidationError(
    BuildContext context, {
    required String message,
    String? title,
  }) {
    showError(
      context,
      message: message,
      title: title ?? 'Validation Error',
    );
  }

  /// Shows a toast for permission error
  static void showPermissionError(
    BuildContext context, {
    required String permission,
    String? title,
  }) {
    showError(
      context,
      message: 'Permission denied: $permission',
      title: title ?? 'Permission Error',
    );
  }

  /// Dismisses all toast notifications
  static void dismissAll() {
    toastification.dismissAll();
  }

  /// Dismisses a specific toast by its ID
  static void dismissActiveToast() {
    if (toastificationItem != null) {
      toastification.dismiss(toastificationItem!);
    }
  }
}
