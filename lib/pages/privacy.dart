import 'package:flutter/material.dart';

class _HalfCircleBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _createHalfCirclePath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this; // No scaling needed, return the same shape instance
  }

  Path _createHalfCirclePath(Rect rect) {
    final path = Path();
    final double radius = rect.height / 2;

    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.right - radius, rect.top);
    path.arcToPoint(
      Offset(rect.right, rect.top + radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(rect.left, rect.bottom);
    path.close();

    return path;
  }
}
