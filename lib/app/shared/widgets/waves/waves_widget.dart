import 'dart:math';

import 'package:flutter/material.dart';

import 'package:musicplayer/app/shared/model/waves_model.dart';

class WavesWidget extends StatefulWidget {
  final double timeMusic;

  const WavesWidget({Key key, this.timeMusic}) : super(key: key);

  @override
  _WavesWidgetState createState() => _WavesWidgetState();
}

class _WavesWidgetState extends State<WavesWidget>
    with TickerProviderStateMixin {
  static const size = const Size(150.0, 5.0);
  final random = Random();
  AnimationController animation;
  VibesTween tween;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    tween = VibesTween(
      Wave.empty(size),
      Wave.random(size, random),
    );
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeWave() {
    setState(() {
      tween = VibesTween(
        tween.evaluate(animation),
        Wave.random(size, random),
      );
    });
    animation.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.00,
      height: 340.00,
      padding: const EdgeInsets.all(55.0),
      child: CustomPaint(
        size: size,
        painter: WavesPainter(tween.animate(animation)),
      ),
    );
  }
}

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
