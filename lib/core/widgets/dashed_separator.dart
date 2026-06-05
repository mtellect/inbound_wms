import 'package:flutter/material.dart';

class DashedSeparator extends StatelessWidget {
  const DashedSeparator({
    super.key,
    this.dashWidth = 2,
    this.color = Colors.grey,
    this.height = 1.0,
    this.direction = Axis.horizontal,
  });

  final num dashWidth;
  final Color color;
  final double height;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedLinePainter(
        dashWidth: dashWidth,
        color: color,
        direction: direction,
      ),
      size: direction == Axis.horizontal ? Size.fromHeight(height) : Size.fromWidth(height),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  const DashedLinePainter({
    required this.dashWidth,
    required this.color,
    this.direction = Axis.horizontal,
  });

  final num dashWidth;
  final Color color;
  final Axis direction;

  @override
  void paint(Canvas canvas, Size size) {
    const dashSpace = 2.0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    if (direction == Axis.horizontal) {
      final yCenter = size.height / 2;
      var xOffset = 0.0;
      while (xOffset < size.width) {
        canvas.drawLine(
          Offset(xOffset, yCenter),
          Offset(xOffset + dashWidth, yCenter),
          paint,
        );
        xOffset += dashWidth + dashSpace;
      }
    } else {
      final xCenter = size.width / 2;
      var yOffset = 0.0;
      while (yOffset < size.height) {
        canvas.drawLine(
          Offset(xCenter, yOffset),
          Offset(xCenter, yOffset + dashWidth),
          paint,
        );
        yOffset += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
