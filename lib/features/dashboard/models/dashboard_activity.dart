import 'package:flutter/material.dart';

class DashboardActivity {
  final String title;
  final DateTime timestamp;
  final IconData icon;
  final Color iconColor;
  final String? poNumber;

  const DashboardActivity({
    required this.title,
    required this.timestamp,
    required this.icon,
    required this.iconColor,
    this.poNumber,
  });

  String get timeAgo {
    final difference = DateTime.now().difference(timestamp);
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }
}
