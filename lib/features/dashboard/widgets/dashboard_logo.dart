import 'package:flutter/material.dart';

class DashboardLogo extends StatelessWidget {
  final bool isDesktop;
  final VoidCallback onTap;

  const DashboardLogo({
    super.key,
    required this.isDesktop,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.warehouse,
                  color: Theme.of(context).primaryColor,
                  size: isDesktop ? 28 : 24,
                ),
              ),
              if (isDesktop) ...[
                const SizedBox(width: 12),
                const Text(
                  'Inbound MS',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
