import 'package:flutter/material.dart';

class DashboardKpi {
  final String title;
  final String value;
  final IconData icon;
  final List<Color> colors;

  const DashboardKpi({
    required this.title,
    required this.value,
    required this.icon,
    required this.colors,
  });
}
