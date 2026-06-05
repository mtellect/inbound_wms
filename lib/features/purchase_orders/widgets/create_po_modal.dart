import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';
import 'package:inbound_ms/core/utils/toast_utils.dart';
import 'package:inbound_ms/core/widgets/app_input_field.dart';
import 'package:inbound_ms/core/widgets/app_button.dart';
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
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: 400,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Purchase Order',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                AppInputField(
                  controller: _poNumberController,
                  labelText: 'PO Number *',
                  validator: (val) => val == null || val.trim().isEmpty ? 'PO Number is required' : null,
                ),
                const SizedBox(height: 16),
                AppInputField(
                  controller: _supplierIdController,
                  labelText: 'Supplier ID (Optional)',
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Blind Receiving'),
                  subtitle: const Text('Receive without seeing expected quantities'),
                  value: _blindReceiving,
                  onChanged: (val) => setState(() => _blindReceiving = val),
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _isSubmitting ? null : () => context.router.maybePop(),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 120,
                      child: AppButton(
                        label: 'Create',
                        onPressed: _submit,
                        isLoading: _isSubmitting,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
