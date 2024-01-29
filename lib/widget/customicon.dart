import 'package:flutter/material.dart';
import 'dart:math' as math;

class StarTickIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      width: MediaQuery.of(context).size.width * 0.16,
      height: MediaQuery.of(context).size.width * 0.18,
      child: CustomPaint(
        painter: StarTickPainter(),
      ),
    );
  }
}

class StarTickPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintStar = Paint()
      ..color = const Color(0xfff8ba97)
      ..style = PaintingStyle.fill;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double outerRadius = size.width / 2;

    final Path starPath = Path();

    for (int i = 0; i < 5; i++) {
      double angle = (i * 2 * math.pi / 5) - (math.pi / 2);
      double x = centerX + outerRadius * math.cos(angle);
      double y = centerY + outerRadius * math.sin(angle);

      if (i == 0) {
        starPath.moveTo(x, y);
      } else {
        starPath.lineTo(x, y);
      }

      angle += math.pi / 5;
      double innerRadius = outerRadius / 2;
      x = centerX + innerRadius * math.cos(angle);
      y = centerY + innerRadius * math.sin(angle);
      starPath.lineTo(x, y);
    }

    starPath.close();
    canvas.drawPath(starPath, paintStar);

    const double tickSize = 30;
    final double tickTop = centerY - tickSize / 2;
    final double tickLeft = centerX - tickSize / 2;

    const IconData tickIcon = Icons.check;
    const double iconSize = 24;

    const TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'MaterialIcons',
      fontSize: iconSize,
    );

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: String.fromCharCode(tickIcon.codePoint), style: textStyle),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(canvas, Offset(tickLeft, tickTop));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
