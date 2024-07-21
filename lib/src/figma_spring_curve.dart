import 'dart:math' as math;

import 'package:flutter/animation.dart';

// Based on https://www.figma.com/blog/how-we-built-spring-animations/
/// A Custom implementation of [Curve] that implements spring curve
/// commonly used in Figma
class FigmaSpringCurve extends Curve {
  late final double _mW0;
  late final double _mZeta;
  late final double _mWd;
  late final double _mA;
  late final double _mB;

  /// Creates a [FigmaSpringCurve] curve
  FigmaSpringCurve(
    double stiffness,
    double damping,
    double mass, [
    double initialVelocity = 0.5,
  ]) {
    _mW0 = math.sqrt(stiffness / mass);
    _mZeta = damping / (2 * math.sqrt(stiffness * mass));

    if (_mZeta < 1) {
      // Under-damped.
      _mWd = _mW0 * math.sqrt(1 - _mZeta * _mZeta);
      _mA = 1;
      _mB = (_mZeta * _mW0 + -initialVelocity) / _mWd;
    } else {
      // Critically damped (ignoring over-damped case for now).
      _mA = 1;
      _mB = -initialVelocity + _mW0;
    }
  }

  @override
  double transformInternal(double t) {
    if (_mZeta < 1) {
      // Under-damped
      t = math.exp(-t * _mZeta * _mW0) *
          (_mA * math.cos(_mWd * t) + _mB * math.sin(_mWd * t));
    } else {
      // Critically damped (ignoring over-damped case for now).
      t = (_mA + _mB * t) * math.exp(-t * _mW0);
    }

    // Map range from [1..0] to [0..1].
    return 1 - t;
  }

  /// Gentle spring curve
  static FigmaSpringCurve gentle = _FigmaGentleSpringCurve();

  /// Quick spring curve
  static FigmaSpringCurve quick = _FigmaQuickSpringCurve();

  /// Bouncy spring curve
  static FigmaSpringCurve bouncy = _FigmaBouncySpringCurve();

  /// Slow spring curve
  static FigmaSpringCurve slow = _FigmaSlowSpringCurve();
}

class _FigmaGentleSpringCurve extends FigmaSpringCurve {
  _FigmaGentleSpringCurve() : super(100, 15, 1);
}

class _FigmaQuickSpringCurve extends FigmaSpringCurve {
  _FigmaQuickSpringCurve() : super(300, 20, 1);
}

class _FigmaBouncySpringCurve extends FigmaSpringCurve {
  _FigmaBouncySpringCurve() : super(600, 15, 1);
}

class _FigmaSlowSpringCurve extends FigmaSpringCurve {
  _FigmaSlowSpringCurve() : super(80, 20, 1);
}
