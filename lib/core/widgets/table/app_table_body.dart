import 'package:flutter/material.dart';
import 'table_resource.dart';
import 'app_table_cell.dart';


class AppTableBody<T> extends StatefulWidget {
  final AdminResource resource;
  final List<TableRowData<T>> records;
  final bool isLoading;
  final String? errorMessage;
  final void Function(TableRowData<T> record)? onEdit;
  final void Function(TableRowData<T> record)? onDelete;
  final void Function(TableRowData<T> record)? onView;
  final String? searchQuery;
  final int? totalRecords;

  // Pagination
  final int currentPage;
  final int rowsPerPage;
  final int minRows;
  final bool showPagination;
  final Future<void> Function()? onNextPage;
  final Future<void> Function()? onPreviousPage;
  final List<AdminTableAction<T>>? additionalActions;
  final Set<T>? selectedIds;
  final void Function(Set<T>)? onSelectionChanged;

  const AppTableBody({
    super.key,
    required this.resource,
    required this.records,
    required this.isLoading,
    this.errorMessage,
    this.onEdit,
    this.onDelete,
    this.onView,
    this.searchQuery,
    this.totalRecords,
    this.currentPage = 1,
    this.rowsPerPage = 10,
    this.minRows = 5,
    this.showPagination = true,
    this.onNextPage,
    this.onPreviousPage,
    this.additionalActions,
    this.selectedIds,
    this.onSelectionChanged,
  });

  @override
  State<AppTableBody<T>> createState() => _AppTableBodyState<T>();
}

class _AppTableBodyState<T> extends State<AppTableBody<T>> {
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return const Center(child: CircularProgressIndicator(color: Colors.blue));
    }

    if (widget.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(widget.errorMessage!, style: TextStyle(color: Colors.red)),
          ],
        ),
      );
    }

    if (widget.records.isEmpty && (widget.searchQuery ?? '').isNotEmpty) {
      return _buildEmptyState();
    }

    return Column(
      children: [
        _buildTableHeader(),
        const SizedBox(height: 12),
        Expanded(
          child: Scrollbar(
            controller: _verticalController,
            thumbVisibility: true,
            child: ListView.separated(
              controller: _verticalController,
              padding: const EdgeInsets.only(bottom: 24),
              itemCount: widget.records.length < widget.minRows
                  ? widget.minRows
                  : widget.records.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                if (index < widget.records.length) {
                  return _buildTableRow(widget.records[index]);
                } else {
                  return _buildEmptyRow();
                }
              },
            ),
          ),
        ),
        if (widget.showPagination) _buildPagination(),
      ],
    );
  }

  Widget _buildTableHeader() {
    final allSelected = widget.records.isNotEmpty &&
        widget.selectedIds != null &&
        widget.records.every((r) => widget.selectedIds!.contains(r.id));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          if (widget.resource.selectable)
            SizedBox(
              width: 40,
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Colors.grey[500]!),
                child: Checkbox(
                  value: allSelected,
                  activeColor: Colors.blue,
                  onChanged: (val) => _onToggleSelectAll(val ?? false),
                ),
              ),
            ),
          ...widget.resource.columns.map((col) {
            return Expanded(
              flex: col.flex,
              child: Text(
                col.label,
                style: TextStyle(
                  color: Colors.grey[500]!,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }),
          SizedBox(
            width: 80,
            child: Text(
              'Actions',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.grey[500]!,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(TableRowData<T> record) {
    final isSelected = widget.selectedIds?.contains(record.id) ?? false;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.blue.withValues(alpha: 0.1)
            : Colors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? Colors.blue.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: Row(
        children: [
          if (widget.resource.selectable)
            SizedBox(
              width: 40,
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Colors.grey[500]!),
                child: Checkbox(
                  value: isSelected,
                  activeColor: Colors.blue,
                  onChanged: (val) => _onToggleSelect(record.id, val ?? false),
                ),
              ),
            ),
          ...widget.resource.columns.map((col) {
            return Expanded(
              flex: col.flex,
              child: AppTableCell<T>(column: col, record: record),
            );
          }),
          SizedBox(
            width: 80,
            child: Align(
              alignment: Alignment.centerRight,
              child: PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz, color: Colors.grey[500]!),
                color: const Color(0xFF1E1E2E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                ),
                onSelected: (val) {
                  if (val == 'view') {
                    widget.onView?.call(record);
                  } else if (val == 'edit') {
                    widget.onEdit?.call(record);
                  } else if (val == 'delete') {
                    widget.onDelete?.call(record);
                  } else {
                    final action = widget.additionalActions?.firstWhere((a) => a.value == val);
                    action?.onTap(record);
                  }
                },
                itemBuilder: (context) => [
                  if (widget.onView != null)
                    PopupMenuItem(
                      value: 'view',
                      child: Row(
                        children: [
                          Icon(Icons.visibility_outlined, color: Colors.green.shade300, size: 18),
                          const SizedBox(width: 12),
                          Text('View', style: TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      ),
                    ),
                  if (widget.onEdit != null)
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined, color: Colors.blue.shade300, size: 18),
                          const SizedBox(width: 12),
                          Text('Edit', style: TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      ),
                    ),
                  if (widget.onDelete != null)
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete_outline, color: Colors.red.shade300, size: 18),
                          const SizedBox(width: 12),
                          Text('Delete', style: TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      ),
                    ),
                  if (widget.additionalActions != null)
                    ...widget.additionalActions!.map(
                      (action) => PopupMenuItem(
                        value: action.value,
                        child: Row(
                          children: [
                            Icon(action.icon, color: action.iconColor ?? Colors.white, size: 18),
                            const SizedBox(width: 12),
                            Text(action.label, style: TextStyle(color: Colors.white, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyRow() {
    return Container(
      height: 72, // Average height of a row
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.02)),
      ),
    );
  }

  Widget _buildPagination() {
    final start = (widget.currentPage - 1) * widget.rowsPerPage + 1;
    final end = start + widget.records.length - 1;
    final total = widget.totalRecords ?? 0;

    final canPrevious = widget.currentPage > 1;
    final canNext =
        widget.records.length == widget.rowsPerPage && (widget.totalRecords == null || end < total);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Showing $start-$end of $total records',
            style: TextStyle(color: Colors.grey[500]!, fontSize: 13),
          ),
          const SizedBox(width: 24),
          IconButton(
            icon: const Icon(Icons.chevron_left),
            color: canPrevious ? Colors.blue : Colors.grey[500]!.withValues(alpha: 0.3),
            onPressed: canPrevious ? () async => await widget.onPreviousPage?.call() : null,
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            color: canNext ? Colors.blue : Colors.grey[500]!.withValues(alpha: 0.3),
            onPressed: canNext ? () async => await widget.onNextPage?.call() : null,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.search_off, size: 64, color: Colors.blue),
          ),
          const SizedBox(height: 24),
          Text(
            'No matching records',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _onToggleSelectAll(bool selected) {
    if (widget.onSelectionChanged == null) return;
    final newSelection = Set<T>.from(widget.selectedIds ?? {});
    if (selected) {
      newSelection.addAll(widget.records.map((r) => r.id));
    } else {
      for (var r in widget.records) {
        newSelection.remove(r.id);
      }
    }
    widget.onSelectionChanged!(newSelection);
  }

  void _onToggleSelect(T id, bool selected) {
    if (widget.onSelectionChanged == null) return;
    final newSelection = Set<T>.from(widget.selectedIds ?? {});
    if (selected) {
      newSelection.add(id);
    } else {
      newSelection.remove(id);
    }
    widget.onSelectionChanged!(newSelection);
  }
}
