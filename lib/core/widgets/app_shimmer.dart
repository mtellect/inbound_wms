

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

///
/// Shimmer parent, should be used deychop with [AppShimmerChild]
///
/// Based on [Shimmer]
///
class AppShimmerParent extends StatelessWidget {
  const AppShimmerParent({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      // baseColor: AppColors.primary.withOpacity(0.05),
      //   highlightColor: AppColors.primary.withOpacity(0.1),
      child: child,
    );
  }
}

///
/// Shimmer child, should be used deychop with [AppShimmerParent]
///
/// Contains proper shimmer color
///
class AppShimmerChild extends StatelessWidget {
  const AppShimmerChild({
    super.key,
    this.height = double.infinity,
    this.width = double.infinity,
    this.decoration,
    this.radius = 0,
  });

  final Decoration? decoration;
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          decoration: decoration,
          color: decoration != null ? null : Colors.white,
        ),
      ),
    );
  }
}
