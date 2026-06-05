import 'package:flutter/material.dart';

enum AdminColumnType { text, imageText, status, pill, action, color, currency }

/// Represents the data for a single cell in the table.
class TableCellData {
  final String value;
  final String? subValue;
  final String? image;
  final Color? color;
  final num? price;
  final AdminColumnType type;

  const TableCellData({
    required this.value,
    this.subValue,
    this.image,
    this.color,
    this.price,
    this.type = AdminColumnType.text,
  });
}

/// Represents the data for a single row in the table, generic over its ID type [T].
class TableRowData<T> {
  final T id;
  final String? uid;
  final Map<String, TableCellData> cells;

  const TableRowData({
    required this.id,
    this.uid,
    required this.cells,
  });

  /// Helper to get cell data for a specific column key.
  TableCellData? getCell(String key) => cells[key];
}

class AdminResource {
  final String key;
  final String tableName;
  final String? subtitle;
  final String? singularName;
  final List<AdminColumn> columns;
  final bool selectable;
  final List<Widget>? headerActions;

  const AdminResource({
    required this.key,
    required this.tableName,
    this.subtitle,
    this.singularName,
    required this.columns,
    this.selectable = false,
    this.headerActions,
  });
}

class AdminColumn {
  final String key;
  final String label;
  final bool isSortable;
  final AdminColumnType type;
  final int flex;

  const AdminColumn({
    required this.key,
    required this.label,
    this.isSortable = false,
    this.type = AdminColumnType.text,
    this.flex = 1,
  });
}

class AdminTableAction<T> {
  final String label;
  final String value;
  final IconData icon;
  final Color? iconColor;
  final void Function(TableRowData<T> record) onTap;

  const AdminTableAction({
    required this.label,
    required this.value,
    required this.icon,
    this.iconColor,
    required this.onTap,
  });
}

// Typedefs for backward compatibility (using dynamic for T where not specified)
typedef AdminRowData = TableRowData<dynamic>;
typedef AdminCellData = TableCellData;
typedef AppTableResource = AdminResource;
typedef AppTableColumn = AdminColumn;
typedef AppTableColumnType = AdminColumnType;
typedef AppTableRowData = TableRowData<dynamic>;
typedef AppTableCellData = TableCellData;
