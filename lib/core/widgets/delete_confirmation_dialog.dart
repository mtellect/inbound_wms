import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';
import 'package:inbound_ms/core/widgets/app_button.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String deleteLabel;
  final VoidCallback onDelete;

  const DeleteConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    this.deleteLabel = 'Delete',
    required this.onDelete,
  });

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    String deleteLabel = 'Delete',
    required VoidCallback onDelete,
  }) {
    return showDialog(
      context: context,
      builder: (context) => DeleteConfirmationDialog(
        title: title,
        message: message,
        deleteLabel: deleteLabel,
        onDelete: onDelete,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.separatorColor),
        ),
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 32),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                style: const TextStyle(color: AppColors.textPrimaryLight, fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                message,
                style: const TextStyle(color: AppColors.textSecondaryLight, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: 'Cancel',
                      backgroundColor: Colors.grey.shade400,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AppButton(
                      label: deleteLabel,
                      backgroundColor: Colors.redAccent,
                      onPressed: () {
                        Navigator.pop(context);
                        onDelete();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
