import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/app/shared/model/waves_model.dart';

class VibesTween extends Tween<Wave> {
  VibesTween(Wave begin, Wave end) : super(begin: begin, end: end);

  @override
  Wave lerp(double t) => Wave.lerp(begin, end, t);
}

class WavesPainter extends CustomPainter {
  WavesPainter(Animation<Wave> animation)
      : animation = animation,
        super(repaint: animation);

  final Animation<Wave> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    canvas.translate(size.width / 2, size.height / 2);

    canvas.save();

    final radius = size.width / 2;
    final chart = animation.value;

    for (final wave in chart.wave) {
      paint.color = wave.color;
      canvas.drawLine(
        Offset(0.0, -radius),
        Offset(1.0, -radius - (wave.height * 40)),
        paint,
      );

      canvas.drawRect(
        Rect.fromLTRB(0.00, -radius, 2.00, -radius - (wave.height * 25)),
        paint,
      );
      canvas.rotate(2 * (3.14) / chart.wave.length);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(WavesPainter old) => true;
}