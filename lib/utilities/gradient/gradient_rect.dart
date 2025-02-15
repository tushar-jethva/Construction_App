import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';

class GradientShape extends StatelessWidget {
  bool isActive;
  GradientShape({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CustomPaint(
            size:
                const Size(25, 25), // Set the size based on the SVG dimensions
            painter: GradientShapePainter(),
          )
        : SizedBox(
            width: const Size(22, 22).width,
            height: const Size(22, 22).height,
          );
  }
}

class GradientShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the gradient as per the SVG definition
    final gradient = LinearGradient(
      begin: Alignment(0.0, -1.0), // From the top
      end: Alignment(0.0, 1.0), // To the bottom
      colors: [
        purple,
        Color.fromARGB(0, 55, 198, 255), // Gradient with opacity
      ],
      stops: [0, 1],
    );

    // Create a paint object with the gradient
    final paint = Paint()
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    // Define the path for the shape
    Path path = Path();
    path.moveTo(0.951624 * (size.width / 22), 5.36697 * (size.height / 22));
    path.cubicTo(
      0.00299418 * (size.width / 22),
      2.75823 * (size.height / 22),
      1.93494 * (size.width / 22),
      0,
      4.7108 * (size.width / 22),
      0,
    );
    path.lineTo(17.2892 * (size.width / 22), 0);
    path.cubicTo(
      20.0651 * (size.width / 22),
      0,
      21.997 * (size.width / 22),
      2.75824 * (size.height / 22),
      21.0484 * (size.width / 22),
      5.36697 * (size.height / 22),
    );
    path.lineTo(15.9575 * (size.width / 22), 19.367 * (size.height / 22));
    path.cubicTo(
      15.3826 * (size.width / 22),
      20.9477 * (size.height / 22),
      13.8803 * (size.width / 22),
      22 * (size.height / 22),
      12.1983 * (size.width / 22),
      22 * (size.height / 22),
    );
    path.lineTo(9.80171 * (size.width / 22), 22 * (size.height / 22));
    path.cubicTo(
      8.11968 * (size.width / 22),
      22 * (size.height / 22),
      6.61736 * (size.width / 22),
      20.9477 * (size.height / 22),
      6.04254 * (size.width / 22),
      19.367 * (size.height / 22),
    );
    path.lineTo(0.951624 * (size.width / 22), 5.36697 * (size.height / 22));
    path.close();

    // Draw the shape with the gradient
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
