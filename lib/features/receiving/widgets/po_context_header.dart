import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';
import 'package:inbound_ms/core/widgets/app_dropdown_button.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';
import 'package:inbound_ms/features/receiving/widgets/meta_field.dart';

class PoContextHeader extends StatelessWidget {
  final PurchaseOrder? selectedPo;
  final ValueChanged<String?> onPoSelected;

  const PoContextHeader({
    super.key,
    required this.selectedPo,
    required this.onPoSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SELECT PO #',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 8),
              Consumer<PurchaseOrderProvider>(
                builder: (context, provider, child) {
                  return AppDropDownButton<String>(
                    value: selectedPo?.id,
                    hint: const Text('Select a Purchase Order'),
                    isSearchable: true,
                    searchHint: 'Search PO...',
                    items: provider.activeOrders
                        .map((po) => DropdownMenuItem(
                              value: po.id,
                              child: Text(po.poNumber),
                            ))
                        .toList(),
                    onChanged: onPoSelected,
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: MetaField(
            label: 'SUPPLIER',
            value: selectedPo?.supplierId ?? '---',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: MetaField(
            label: 'DATE',
            value: selectedPo?.createdAt?.toIso8601String().split('T')[0] ?? '---',
            isDate: true,
          ),
        ),
      ],
    );
  }
}
