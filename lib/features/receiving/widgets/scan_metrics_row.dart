import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';
import 'package:inbound_ms/features/receiving/widgets/metric_card.dart';

class ScanMetricsRow extends StatelessWidget {
  final int totalExpected;
  final int totalScanned;
  final int mismatches;
  final int unexpectedScans;

  const ScanMetricsRow({
    super.key,
    required this.totalExpected,
    required this.totalScanned,
    required this.mismatches,
    required this.unexpectedScans,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MetricCard(
            label: 'PROGRESS',
            value: '$totalScanned / $totalExpected',
            icon: Icons.inventory_2,
            color: AppColors.info,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: MetricCard(
            label: 'OVERAGES',
            value: '$mismatches',
            icon: Icons.warning,
            color: AppColors.warning,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: MetricCard(
            label: 'UNEXPECTED',
            value: '$unexpectedScans',
            icon: Icons.cancel,
            color: AppColors.error,
          ),
        ),
      ],
    );
  }
}
