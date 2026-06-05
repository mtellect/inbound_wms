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
                color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.table_rows_outlined, size: 64, color: Theme.of(context).primaryColor.withValues(alpha: 0.5)),
            ),
            const SizedBox(height: 24),
            Text(
              emptyMessage!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        _buildHeader(context),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 32),
            itemCount: rows.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return _buildRow(context, rows[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC), // Slate 50
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)), // Slate 200
      ),
      child: Row(
        children: columns.map((col) {
          return Expanded(
            flex: col.flex,
            child: Text(
              col.label.toUpperCase(),
              style: const TextStyle(
                color: Color(0xFF64748B), // Slate 500
                fontSize: 12,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRow(BuildContext context, AppDataRow row) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: row.isSelected
            ? Theme.of(context).primaryColor.withValues(alpha: 0.05)
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: row.isSelected 
            ? Theme.of(context).primaryColor.withValues(alpha: 0.3) 
            : const Color(0xFFF1F5F9), // Slate 100
        ),
        boxShadow: [
          if (!row.isSelected)
            BoxShadow(
              color: const Color(0xFF0F172A).withValues(alpha: 0.03), // Slate 900
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: row.onTap,
          borderRadius: BorderRadius.circular(16),
          splashColor: Theme.of(context).primaryColor.withValues(alpha: 0.05),
          highlightColor: Theme.of(context).primaryColor.withValues(alpha: 0.02),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
      ),
    );
  }
}
