import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/core/widgets/app_button.dart';
import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';

class PurchaseOrderFiltersModal extends StatefulWidget {
  const PurchaseOrderFiltersModal({super.key});

  @override
  State<PurchaseOrderFiltersModal> createState() => _PurchaseOrderFiltersModalState();
}

class _PurchaseOrderFiltersModalState extends State<PurchaseOrderFiltersModal> {
  String? _selectedStatus;
  
  @override
  void initState() {
    super.initState();
    _selectedStatus = context.read<PurchaseOrderProvider>().statusFilter;
  }
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter Purchase Orders',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
              ),
              value: _selectedStatus,
              items: const [
                DropdownMenuItem(value: null, child: Text('All')),
                DropdownMenuItem(value: 'pending', child: Text('Pending')),
                DropdownMenuItem(value: 'in_progress', child: Text('In Progress')),
                DropdownMenuItem(value: 'completed', child: Text('Completed')),
              ],
              onChanged: (val) {
                setState(() {
                  _selectedStatus = val;
                });
              },
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.withValues(alpha: 0.2)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue, size: 20),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Supplier and Date Range filtering will be supported once backend parameters are added.',
                      style: TextStyle(color: Colors.blue, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            AppButton(
              label: 'Apply Filters',
              onPressed: () {
                context.read<PurchaseOrderProvider>().setStatusFilter(_selectedStatus);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
