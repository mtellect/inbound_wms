import 'package:flutter/material.dart';

class AppDataColumn {
  final String label;
  final int flex;

  const AppDataColumn({
    required this.label,
    this.flex = 1,
  });
}

class AppDataRow {
  final List<Widget> cells;
  final VoidCallback? onTap;
  final bool isSelected;
  final String id;

  const AppDataRow({
    required this.id,
    required this.cells,
    this.onTap,
    this.isSelected = false,
  });
}

class AppDataTable extends StatelessWidget {
  final List<AppDataColumn> columns;
  final List<AppDataRow> rows;
  final bool isLoading;
  final String? emptyMessage;

  const AppDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.isLoading = false,
    this.emptyMessage = 'No records found',
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (rows.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.search_off, size: 64, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 24),
            Text(
              emptyMessage!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        _buildHeader(),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 24),
            itemCount: rows.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _buildRow(context, rows[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: columns.map((col) {
          return Expanded(
            flex: col.flex,
            child: Text(
              col.label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRow(BuildContext context, AppDataRow row) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: row.onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: row.isSelected
                ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: row.isSelected 
                ? Theme.of(context).primaryColor.withValues(alpha: 0.3) 
                : Colors.grey.withValues(alpha: 0.1),
            ),
            boxShadow: [
              if (!row.isSelected)
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
            ],
          ),
          child: Row(
            children: List.generate(columns.length, (index) {
              return Expanded(
                flex: columns[index].flex,
                child: index < row.cells.length ? row.cells[index] : const SizedBox.shrink(),
              );
            }),
          ),
        ),
      ),
    );
  }
}
