import 'package:flutter/material.dart';

import 'table_resource.dart';

class AppTableCell<T> extends StatelessWidget {
  final AdminColumn column;
  final TableRowData<T> record;

  const AppTableCell({super.key, required this.column, required this.record});

  @override
  Widget build(BuildContext context) {
    final cell = record.getCell(column.key);
    if (cell == null) return const SizedBox.shrink();

    // Use the type defined in the cell if available, otherwise fallback to column type
    final type = cell.type;

    switch (type) {
      case AdminColumnType.imageText:
        return _buildImageTextCell(cell);
      case AdminColumnType.status:
        return _buildStatusCell(cell);
      case AdminColumnType.pill:
        return _buildPillCell(cell);
      case AdminColumnType.color:
        return _buildColorCell(cell);
      case AdminColumnType.currency:
        return _buildCurrencyCell(cell);
      default:
        return _buildTextCell(cell);
    }
  }

  Widget _buildImageTextCell(TableCellData cell) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: cell.image != null
                ? Image.network(
                    cell.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Icon(Icons.person_outline, color: Colors.black26));
                    },
                  )
                : Icon(Icons.shopping_bag_outlined, color: Colors.black26),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                cell.value,
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (cell.subValue != null)
                Text(
                  cell.subValue!,
                  style: TextStyle(color: Colors.grey[500]!, fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusCell(TableCellData cell) {
    final statusStr = cell.value.toUpperCase();
    final color = Colors.grey;

    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_getStatusIcon(statusStr), size: 14, color: color),
            const SizedBox(width: 6),
            Text(
              statusStr,
              style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getStatusIcon(String status) {
    final s = status.toLowerCase();
    if (s.contains('delivered')) return Icons.check_circle_outline;
    if (s.contains('shipped')) return Icons.local_shipping_outlined;
    if (s.contains('processing')) return Icons.sync;
    if (s.contains('paid')) return Icons.assignment_turned_in_outlined;
    if (s.contains('pending')) return Icons.hourglass_empty;
    return Icons.help_outline;
  }

  Widget _buildPillCell(TableCellData cell) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(cell.value, style: TextStyle(color: Colors.black87, fontSize: 12)),
    );
  }

  Widget _buildColorCell(TableCellData cell) {
    final color = cell.color ?? Colors.transparent;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black26, width: 1),
            boxShadow: [
              if (color != Colors.transparent)
                BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: 4, spreadRadius: 1),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Text(cell.value, style: TextStyle(color: Colors.black87, fontSize: 14)),
      ],
    );
  }

  Widget _buildTextCell(TableCellData cell) {
    return Text(
      cell.value,
      style: TextStyle(color: Colors.black87, fontSize: 14),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildCurrencyCell(TableCellData cell) {
    return Text(
      '\$${(cell.price ?? 0).toStringAsFixed(2)}',
      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
    );
  }
}
