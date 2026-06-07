import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';
import 'package:inbound_ms/features/purchase_orders/models/po_item.dart';

class ManualEntryDialog extends StatefulWidget {
  final PoItem item;
  final int currentScanned;
  final void Function(String sku, int newQuantity) onUpdateQuantity;

  const ManualEntryDialog({
    super.key,
    required this.item,
    required this.currentScanned,
    required this.onUpdateQuantity,
  });

  @override
  State<ManualEntryDialog> createState() => _ManualEntryDialogState();
}

class _ManualEntryDialogState extends State<ManualEntryDialog> {
  late TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentScanned.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundLight,
      title: Text('Manual Entry: ${widget.item.product?.sku}', style: const TextStyle(color: AppColors.textPrimaryLight)),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Expected Quantity: ${widget.item.expectedQuantity}', style: const TextStyle(color: AppColors.textSecondaryLight)),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              autofocus: true,
              style: const TextStyle(color: AppColors.textPrimaryLight),
              decoration: const InputDecoration(
                labelText: 'Scanned Quantity',
                labelStyle: TextStyle(color: AppColors.textSecondaryLight),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.separatorColor)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Enter a quantity';
                final val = int.tryParse(value);
                if (val == null) return 'Must be a valid number';
                if (val < 0) return 'Cannot be negative';
                if (val > widget.item.expectedQuantity) {
                  return 'Cannot exceed expected (${widget.item.expectedQuantity})';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondaryLight)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: AppColors.textPrimaryDark),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newQuantity = int.parse(_controller.text);
              widget.onUpdateQuantity(widget.item.product!.sku.toUpperCase(), newQuantity);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
