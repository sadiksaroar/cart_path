import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  TicketClipper({
    this.position = 50,
    this.radius = 15,
  });

  final double position; // Fixed typo: "postion" -> "position"
  final double radius;

  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;

    final path = Path();

    // Start at top-left corner
    path.moveTo(0, 0);
    path.lineTo(w, 0); // Top edge

    // Top-right corner to the right circular cut
    path.lineTo(w, position - radius);
    path.arcToPoint(
      Offset(w, position + radius), // Create a circular notch
      clockwise: false,
      radius: Radius.circular(radius),
    );

    // Continue to bottom-right corner
    path.lineTo(w, h); // Right edge

    // Bottom-right corner to bottom-left
    path.lineTo(0, h); // Bottom edge

    // Left circular cut
    path.lineTo(0, position + radius);
    path.arcToPoint(
      Offset(0, position - radius), // Create a circular notch
      clockwise: false,
      radius: Radius.circular(radius),
    );

    // Close the path back to top-left
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // Reclip only if position or radius changes
    return oldClipper is TicketClipper &&
        (oldClipper.position != position || oldClipper.radius != radius);
  }
}
