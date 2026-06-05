import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/features/auth/providers/auth_provider.dart';

import 'package:inbound_ms/features/purchase_orders/widgets/create_po_modal.dart';
import 'package:inbound_ms/features/purchase_orders/widgets/import_orders_modal.dart';
import 'package:inbound_ms/features/receiving/widgets/scan_po_modal.dart';
import 'package:inbound_ms/core/utils/dialog_utils.dart';


class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isManager = context.watch<AuthProvider>().isManager;

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F2027).withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, color: Colors.white),
            ),
            const SizedBox(height: 24),
            if (isManager) ...[
              _buildActionTile(context, 'Create PO', Icons.add, () {
                DialogUtils.showDialog(context: context, builder: (_) => const CreatePoModal());
              }),
              const SizedBox(height: 12),
              _buildActionTile(context, 'Import CSV/Excel', Icons.file_upload, () {
                DialogUtils.showDialog(context: context, builder: (_) => const ImportOrdersModal());
              }),
              const SizedBox(height: 12),
            ],
            _buildActionTile(context, 'Scan Label', Icons.document_scanner, () {
              DialogUtils.showDialog(context: context, builder: (_) => const ScanPoModal());
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.white.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
