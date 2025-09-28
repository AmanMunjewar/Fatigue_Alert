import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularFatigueMeter extends StatelessWidget {
  final double score;

  const CircularFatigueMeter({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CircularFatiguePainter(score),
      child: Center(
        child: Text(
          '${score.toInt()}',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: _getScoreColor(score),
              ),
        ),
      ),
    );
  }

  Color _getScoreColor(double score) {
    if (score <= 40) {
      return Colors.green;
    } else if (score <= 70) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}

class _CircularFatiguePainter extends CustomPainter {
  final double score;

  _CircularFatiguePainter(this.score);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2);
    const strokeWidth = 20.0;

    final backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    final scorePaint = Paint()
      ..color = _getScoreColor(score)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    const startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * (score / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      scorePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Color _getScoreColor(double score) {
    if (score <= 40) {
      return Colors.green;
    } else if (score <= 70) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}