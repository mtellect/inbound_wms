import 'package:flutter/material.dart';

class BulkActionToolbar extends StatelessWidget {
  final int selectedCount;
  final VoidCallback onClear;
  final VoidCallback? onEditPrice;
  final VoidCallback? onAdjustStock;
  final VoidCallback? onToggleStatus;
  final VoidCallback? onDelete;

  const BulkActionToolbar({
    super.key,
    required this.selectedCount,
    required this.onClear,
    this.onEditPrice,
    this.onAdjustStock,
    this.onToggleStatus,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedCount == 0) return const SizedBox.shrink();

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      bottom: 24,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E2E),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            border: Border.all(color: Colors.blue.withValues(alpha: 0.3), width: 1.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$selectedCount Selected',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              _ActionButton(
                icon: Icons.sell_outlined,
                label: 'Price',
                onTap: onEditPrice,
                color: Colors.teal.shade300,
              ),
              _ActionButton(
                icon: Icons.inventory_2_outlined,
                label: 'Stock',
                onTap: onAdjustStock,
                color: Colors.orange.shade300,
              ),
              _ActionButton(
                icon: Icons.visibility_outlined,
                label: 'Status',
                onTap: onToggleStatus,
                color: Colors.blue.shade300,
              ),
              const SizedBox(width: 8),
              const VerticalDivider(width: 1, indent: 8, endIndent: 8, color: Colors.black12),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.close, color: Colors.grey[500]!, size: 20),
                onPressed: onClear,
                tooltip: 'Clear Selection',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color color;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.black.withValues(alpha: 0.8),
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
