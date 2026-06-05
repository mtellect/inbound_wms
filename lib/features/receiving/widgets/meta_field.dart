import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';

class MetaField extends StatelessWidget {
  final String label;
  final String value;
  final bool isDate;

  const MetaField({
    super.key,
    required this.label,
    required this.value,
    this.isDate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.separatorColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimaryLight,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              if (isDate && value != '---')
                const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: AppColors.textSecondaryLight,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
