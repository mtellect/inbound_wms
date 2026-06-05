import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';
import 'package:inbound_ms/core/widgets/app_dropdown_button.dart';
import 'package:inbound_ms/features/receiving/models/scan_session.dart';
import 'package:inbound_ms/features/receiving/providers/session_provider.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SessionDetailsModal extends StatefulWidget {
  final ScanSession session;

  const SessionDetailsModal({super.key, required this.session});

  @override
  State<SessionDetailsModal> createState() => _SessionDetailsModalState();
}

class _SessionDetailsModalState extends State<SessionDetailsModal> {
  late String _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.session.status;
  }

  void _save() {
    final provider = context.read<SessionProvider>();
    if (_selectedStatus != widget.session.status) {
      provider.updateSessionStatus(widget.session.id, _selectedStatus);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(48),
      child: Container(
        width: 600,
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Session Details',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: AppColors.textPrimaryLight)),
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.textSecondaryLight),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('Session Number: ${widget.session.sessionNumber}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('PO Number: ${widget.session.poNumber ?? 'N/A'}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Shipment: ${widget.session.shipmentId ?? 'N/A'}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Operator: ${widget.session.operatorName}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Progress: ${widget.session.totalScanned} / ${widget.session.totalExpected}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Discrepancies: ${widget.session.discrepancies}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 24),
              const Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AppDropDownButton<String>(
                value: _selectedStatus,
                items: ['active', 'paused', 'completed', 'completed_with_errors'].map((s) => DropdownItem<String>(
                  value: s,
                  child: Text(s.toUpperCase().replaceAll('_', ' ')),
                )).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedStatus = val);
                },
                hint: const Text('Select Status'),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textPrimaryDark,
                    ),
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
