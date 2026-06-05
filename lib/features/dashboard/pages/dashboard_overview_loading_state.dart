import 'package:flutter/material.dart';
import 'package:inbound_ms/core/widgets/app_shimmer.dart';
import 'package:inbound_ms/features/dashboard/widgets/section_card.dart';

class DashboardOverviewLoadingState extends StatelessWidget {
  const DashboardOverviewLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: const [
        DashboardKpiLoadingState(),
        SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: DashboardRecentActivityLoadingState()),
            SizedBox(width: 24),
            Expanded(flex: 1, child: DashboardQuickActionsLoadingState()),
          ],
        ),
      ],
    );
  }
}

class DashboardKpiLoadingState extends StatelessWidget {
  const DashboardKpiLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmerParent(
      child: Row(
        children: List.generate(4, (index) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: index < 3 ? 16.0 : 0),
              child: const AppShimmerChild(height: 200, radius: 24),
            ),
          );
        }),
      ),
    );
  }
}

class DashboardRecentActivityLoadingState extends StatelessWidget {
  const DashboardRecentActivityLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Recent Activity',
      child: AppShimmerParent(
        child: Column(
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const AppShimmerChild(height: 44, width: 44, radius: 22),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          AppShimmerChild(height: 14, width: 150, radius: 4),
                          SizedBox(height: 8),
                          AppShimmerChild(height: 12, width: 80, radius: 4),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    const AppShimmerChild(height: 24, width: 24, radius: 12),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DashboardQuickActionsLoadingState extends StatelessWidget {
  const DashboardQuickActionsLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppShimmerChild(height: 24, width: 150, radius: 4),
            const SizedBox(height: 24),
            ...List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: AppShimmerParent(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
                    ),
                    child: Row(
                      children: const [
                        AppShimmerChild(height: 24, width: 24, radius: 12),
                        SizedBox(width: 16),
                        AppShimmerChild(height: 16, width: 100, radius: 4),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
