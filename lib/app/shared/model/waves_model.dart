import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Vibes {
  Vibes(this.height, this.color);

  final double height;
  final Color color;

  Vibes get collapsed => new Vibes(0.0, color);

  static Vibes lerp(Vibes begin, Vibes end, double t) {
    return new Vibes(
      lerpDouble(begin.height, end.height, t),
      Color.lerp(begin.color, end.color, t),
    );
  }
}

class Wave {
  Wave(this.wave);

  factory Wave.empty(Size size) {
    return new Wave(<Vibes>[]);
  }

  factory Wave.random(Size size, Random random) {
    final waveLenght = 150;

    final color = Colors.primaries;
    final bars = new List.generate(
      waveLenght,
      (i) => new Vibes(
        random.nextDouble(),
        color[Random().nextInt(17)],
      ),
    );
    return new Wave(bars);
  }

  final List<Vibes> wave;

  static Wave lerp(Wave begin, Wave end, double t) {
    final waveLength = max(begin.wave.length, end.wave.length);
    final waves = new List.generate(
      waveLength,
      (i) => Vibes.lerp(
        begin._getWaves(i) ?? end.wave[i].collapsed,
        end._getWaves(i) ?? begin.wave[i].collapsed,
        t,
      ),
    );
    return new Wave(waves);
  }

  Vibes _getWaves(int index) => (index < wave.length ? wave[index] : null);
}
