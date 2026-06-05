import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';
import 'package:inbound_ms/core/utils/toast_utils.dart';
import 'package:auto_route/auto_route.dart';

class CreatePoModal extends StatefulWidget {
  const CreatePoModal({super.key});

  @override
  State<CreatePoModal> createState() => _CreatePoModalState();
}

class _CreatePoModalState extends State<CreatePoModal> {
  final _formKey = GlobalKey<FormState>();
  final _poNumberController = TextEditingController();
  final _supplierIdController = TextEditingController();
  bool _blindReceiving = false;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _poNumberController.dispose();
    _supplierIdController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      await context.read<PurchaseOrderProvider>().createOrder(
        poNumber: _poNumberController.text.trim(),
        supplierId: _supplierIdController.text.trim().isEmpty ? null : _supplierIdController.text.trim(),
        blindReceiving: _blindReceiving,
      );
      
      if (mounted) {
        context.router.maybePop();
        ToastUtils.showSuccess(context, message: "Purchase order created successfully");
      }
    } catch (e) {
      if (mounted) {
        ToastUtils.showError(context, message: "Failed to create order: $e");
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Purchase Order'),
      content: SizedBox(
        width: 400,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _poNumberController,
                decoration: const InputDecoration(
                  labelText: 'PO Number *',
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.trim().isEmpty ? 'PO Number is required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _supplierIdController,
                decoration: const InputDecoration(
                  labelText: 'Supplier ID (Optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Blind Receiving'),
                subtitle: const Text('Receive without seeing expected quantities'),
                value: _blindReceiving,
                onChanged: (val) => setState(() => _blindReceiving = val),
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSubmitting ? null : () => context.router.maybePop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isSubmitting ? null : _submit,
          child: _isSubmitting 
              ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) 
              : const Text('Create'),
        ),
      ],
    );
  }
}
