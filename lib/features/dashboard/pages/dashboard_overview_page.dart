import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/core/widgets/page_header.dart';
import 'package:inbound_ms/core/utils/toast_utils.dart';
import 'package:inbound_ms/core/utils/dialog_utils.dart';
import 'package:inbound_ms/features/receiving/pages/scan_po_page.dart';

@RoutePage()
class DashboardOverviewPage extends StatelessWidget {
  const DashboardOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PageHeader(
            title: 'Overview',
            subtitle: 'Welcome to Inbound MS. Here is what is happening today.',
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                // KPI Cards
                Row(
                  children: [
                    _buildKpiCard(
                      context,
                      title: 'Total POs',
                      value: '124',
                      icon: Icons.receipt_long,
                      colors: [Colors.blue[400]!, Colors.blue[700]!],
                    ),
                    const SizedBox(width: 16),
                    _buildKpiCard(
                      context,
                      title: 'Pending Shipments',
                      value: '18',
                      icon: Icons.local_shipping,
                      colors: [Colors.orange[400]!, Colors.orange[700]!],
                    ),
                    const SizedBox(width: 16),
                    _buildKpiCard(
                      context,
                      title: 'Open Discrepancies',
                      value: '3',
                      icon: Icons.report_problem,
                      colors: [Colors.red[400]!, Colors.red[700]!],
                    ),
                    const SizedBox(width: 16),
                    _buildKpiCard(
                      context,
                      title: 'Active Suppliers',
                      value: '42',
                      icon: Icons.storefront,
                      colors: [Colors.teal[400]!, Colors.teal[700]!],
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Recent Activity / Content
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildSectionCard(
                        context,
                        title: 'Recent Activity',
                        child: Column(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Theme.of(
                                              context,
                                            ).primaryColor.withValues(alpha: 0.05),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.history,
                                            color: Theme.of(context).primaryColor,
                                            size: 20,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'PO-2024-00${index + 1} received',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                '${index + 1} hours ago',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Icon(Icons.chevron_right, color: Colors.grey),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(flex: 1, child: _buildQuickActionsCard(context)),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKpiCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required List<Color> colors,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: colors.last.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(height: 24),
              Text(
                value,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF0F172A),
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF64748B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, {required String title, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 24),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F2027).withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, color: Colors.white),
            ),
            const SizedBox(height: 24),
            _buildActionTile(context, 'Create PO', Icons.add, () {
              ToastUtils.showInfo(context, message: 'PO Creation Form not yet implemented');
            }),
            const SizedBox(height: 12),
            _buildActionTile(context, 'Import CSV', Icons.file_upload, () {
              ToastUtils.showInfo(context, message: 'CSV Importer not yet implemented');
            }),
            const SizedBox(height: 12),
            _buildActionTile(context, 'Scan Label', Icons.document_scanner, () {
              DialogUtils.showDialog(
                context: context,
                builder: (_) => const ScanPoPage(),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.white.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
