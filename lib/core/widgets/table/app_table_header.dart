import 'package:flutter/material.dart';

import 'table_resource.dart';

class AppTableHeader extends StatelessWidget {
  final AdminResource resource;
  final int totalRecords;
  final int currentRecordsCount;
  final String? searchQuery;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onClearSearch;
  final VoidCallback? onAdd;
  final TextEditingController searchController;
  final List<Widget>? filters;

  const AppTableHeader({
    super.key,
    required this.resource,
    required this.totalRecords,
    required this.currentRecordsCount,
    this.searchQuery,
    this.onSearchChanged,
    this.onClearSearch,
    this.onAdd,
    required this.searchController,
    this.filters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildResourceInfo(context),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildResourceInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          resource.tableName,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        _buildRecordsCountChip(),
      ],
    );
  }

  Widget _buildRecordsCountChip() {
    final countText = totalRecords != currentRecordsCount
        ? '$currentRecordsCount of $totalRecords records'
        : '$currentRecordsCount records';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.table_rows, size: 16, color: Colors.blue),
          const SizedBox(width: 8),
          Text(
            countText,
            style: TextStyle(
              color: Colors.grey[700]!,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        if (filters != null) ...[
          ...filters!,
          const SizedBox(width: 16),
        ],
        if (onSearchChanged != null) ...[
          _buildSearchInput(context),
          const SizedBox(width: 16),
        ],
        if (onAdd != null) _buildAddRecordButton(context),
      ],
    );
  }

  Widget _buildSearchInput(BuildContext context) {
    final hasSearchQuery = (searchQuery ?? '').isNotEmpty;

    return SizedBox(
      width: 300,
      height: 44,
      child: TextField(
        controller: searchController,
        style: TextStyle(color: Colors.black87, fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Search ${resource.tableName}...',
          hintStyle: TextStyle(color: Colors.grey[500]!),
          prefixIcon: Icon(Icons.search, size: 20, color: Colors.grey[500]!),
          suffixIcon: hasSearchQuery
              ? IconButton(
                  icon: Icon(Icons.clear, size: 18, color: Colors.grey[500]!),
                  onPressed: onClearSearch,
                )
              : null,
          filled: true,
          fillColor: Colors.black.withValues(alpha: 0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black.withValues(alpha: 0.1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black.withValues(alpha: 0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        onChanged: onSearchChanged,
      ),
    );
  }

  Widget _buildAddRecordButton(BuildContext context) {
    String label = resource.singularName ?? _getSingularName(resource.tableName);
    return FilledButton.icon(
      label: Text('Add $label'),
      onPressed: onAdd!,
      icon: const Icon(Icons.add),
    );
  }

  String _getSingularName(String plural) {
    if (plural.toLowerCase().endsWith('ies')) {
      return '${plural.substring(0, plural.length - 3)}y';
    }
    if (plural.toLowerCase().endsWith('s')) {
      return plural.substring(0, plural.length - 1);
    }
    return plural;
  }
}
