import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ActiveScanPage extends StatefulWidget {
  const ActiveScanPage({super.key});

  @override
  State<ActiveScanPage> createState() => _ActiveScanPageState();
}

class _ActiveScanPageState extends State<ActiveScanPage> {
  final TextEditingController _scanController = TextEditingController();
  final FocusNode _scanFocusNode = FocusNode();

  @override
  void dispose() {
    _scanController.dispose();
    _scanFocusNode.dispose();
    super.dispose();
  }

  void _onScan() {
    final barcode = _scanController.text.trim();
    if (barcode.isEmpty) return;
    
    // Process barcode...
    _scanController.clear();
    _scanFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Meta Data
          Row(
            children: [
              Expanded(
                child: _buildMetaField('SHIPMENT #', 'ANDREW123'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMetaField('SUPPLIER', 'EMEKA'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMetaField('DATE', '04/06/2026', isDate: true),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Scanner Input
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _scanController,
                  focusNode: _scanFocusNode,
                  autofocus: true,
                  onSubmitted: (_) => _onScan(),
                  decoration: InputDecoration(
                    hintText: 'Scan barcode — press Enter',
                    prefixIcon: const Icon(Icons.qr_code_scanner),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: _onScan,
                icon: const Icon(Icons.camera_alt),
                label: const Text('Scan'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.undo),
                label: const Text('Undo'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Metrics
          Row(
            children: [
              Expanded(child: _buildMetricCard('TOTAL UNITS', '0', Icons.inventory_2, Colors.grey)),
              const SizedBox(width: 16),
              Expanded(child: _buildMetricCard('CORRECT', '0', Icons.check_circle, Colors.green)),
              const SizedBox(width: 16),
              Expanded(child: _buildMetricCard('MISMATCH', '0', Icons.warning, Colors.orange)),
              const SizedBox(width: 16),
              Expanded(child: _buildMetricCard('WRONG', '0', Icons.cancel, Colors.red)),
            ],
          ),
          const SizedBox(height: 32),

          // Session Table
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Current session', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            TextButton.icon(onPressed: () {}, icon: const Icon(Icons.save), label: const Text('Save')),
                            TextButton.icon(onPressed: () {}, icon: const Icon(Icons.clear_all), label: const Text('Clear')),
                            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.download), label: const Text('Export CSV')),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  // Mock Empty Table
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inbox, size: 48, color: Colors.grey.shade300),
                          const SizedBox(height: 16),
                          Text('No scans yet', style: TextStyle(color: Colors.grey.shade500)),
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

  Widget _buildMetaField(String label, String value, {bool isDate = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
              if (isDate) const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 12),
              Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
            ],
          ),
          Text(value, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
