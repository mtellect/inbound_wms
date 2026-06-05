import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';

class AppTableEmptyState extends StatelessWidget {
  final bool isNoResults;
  final String? resourceName;

  const AppTableEmptyState({
    super.key,
    this.isNoResults = false,
    this.resourceName,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isNoResults ? Icons.search_off : Icons.table_chart_outlined,
                size: 64,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              isNoResults ? 'No matching records' : 'Select a Resource',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              isNoResults 
                ? 'Try adjusting your search query or filters for $resourceName.'
                : 'Choose a resource from the sidebar to view and manage its records.',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
