import 'package:flutter/material.dart';
import 'table_resource.dart';
import 'app_table_body.dart';
import 'app_table_header.dart';
import 'app_table_empty_state.dart';

class AppTableView<T> extends StatefulWidget {
  final AdminResource? resource;
  final List<TableRowData<T>> records;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback? onAdd;
  final void Function(TableRowData<T> record)? onEdit;
  final void Function(TableRowData<T> record)? onDelete;
  final void Function(TableRowData<T> record)? onView;
  final int? totalRecords;
  final String? searchQuery;
  final void Function(String)? onSearchChanged;
  final VoidCallback? onClearSearch;
  
  // Pagination
  final int currentPage;
  final int rowsPerPage;
  final Future<void> Function()? onNextPage;
  final Future<void> Function()? onPreviousPage;
  final List<Widget>? filters;
  final bool showPagination;
  final List<AdminTableAction<T>>? additionalActions;
  
  // Selection
  final Set<T>? selectedIds;
  final void Function(Set<T>)? onSelectionChanged;
  
  // Loading state per record
  final Set<T>? loadingRecordIds;

  const AppTableView({
    super.key,
    required this.resource,
    required this.records,
    required this.isLoading,
    this.errorMessage,
    this.onAdd,
    this.onEdit,
    this.onDelete,
    this.onView,
    this.totalRecords,
    this.searchQuery,
    this.onSearchChanged,
    this.onClearSearch,
    this.currentPage = 1,
    this.rowsPerPage = 10,
    this.onNextPage,
    this.onPreviousPage,
    this.filters,
    this.showPagination = true,
    this.additionalActions,
    this.selectedIds,
    this.onSelectionChanged,
    this.loadingRecordIds,
  });

  @override
  State<AppTableView<T>> createState() => _AppTableViewState<T>();
}

class _AppTableViewState<T> extends State<AppTableView<T>> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.searchQuery ?? '');
  }

  @override
  void didUpdateWidget(AppTableView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.resource?.key != widget.resource?.key) {
      _searchController.clear();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.resource == null) {
      return const AppTableEmptyState();
    }

    return Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))]), child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTableHeader(
            resource: widget.resource!,
            totalRecords: widget.totalRecords ?? widget.records.length,
            currentRecordsCount: widget.records.length,
            searchQuery: widget.searchQuery,
            onSearchChanged: widget.onSearchChanged,
            onClearSearch: () {
              _searchController.clear();
              widget.onClearSearch?.call();
            },
            onAdd: widget.onAdd,
            searchController: _searchController,
            filters: widget.filters,
          ),
          const Divider(height: 1, thickness: 1, color: Colors.white10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: AppTableBody<T>(
                resource: widget.resource!,
                records: widget.records,
                isLoading: widget.isLoading,
                errorMessage: widget.errorMessage,
                onEdit: widget.onEdit,
                onDelete: widget.onDelete,
                onView: widget.onView,
                searchQuery: widget.searchQuery,
                totalRecords: widget.totalRecords,
                currentPage: widget.currentPage,
                rowsPerPage: widget.rowsPerPage,
                onNextPage: widget.onNextPage,
                onPreviousPage: widget.onPreviousPage,
                showPagination: widget.showPagination,
                additionalActions: widget.additionalActions,
                selectedIds: widget.selectedIds,
                onSelectionChanged: widget.onSelectionChanged,
                loadingRecordIds: widget.loadingRecordIds,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
