import 'dart:math';
import 'package:flutter/material.dart';
import 'package:glueksrad/wheel/wheel_config.dart';

/// A customizable Wheel of Fortune widget for Flutter.
class WheelOfFortune extends StatefulWidget {
  final WheelConfig config;

  final void Function(Event event, int section) onResult;

  const WheelOfFortune({
    super.key,
    required this.config,
    required this.onResult,
  });

  @override
  State<WheelOfFortune> createState() => _WheelOfFortuneState();
}

class _WheelOfFortuneState extends State<WheelOfFortune>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _currentAngle = 0;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation =
        Tween<double>(begin: 0, end: 0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.decelerate),
          )
          ..addListener(() {
            setState(() {
              _currentAngle = _animation.value;
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _calculateResult();
            }
          });
  }

  /// Spin the wheel with a random amount of rotation.
  void spin() {
    final double randomSpin = _random.nextDouble() + 2;
    _animation = Tween<double>(
      begin: _currentAngle,
      end: _currentAngle + randomSpin,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    _controller
      ..reset()
      ..forward();
  }

  /// Determine which segment the wheel stopped on.
  void _calculateResult() {
    final (Event event, int section) = WheelPaint.calculateResult(
      _currentAngle,
      widget.config,
    );
    widget.onResult(event, section);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: spin,
      child: WheelPaint(config: widget.config, angle: _currentAngle),
    );
  }
}

class WheelPaint extends StatelessWidget {
  final WheelConfig config;
  final double angle;

  const WheelPaint({super.key, required this.config, required this.angle});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _WheelPainter(config, angle));
  }

  static (Event event, int section) calculateResult(
    double angle,
    WheelConfig config,
  ) {
    final normaized = -angle % 1;

    final segments = calculateSegments(config);

    for (int i = 0; i < segments.length; i++) {
      if (normaized >= segments[i].start && normaized < segments[i].end) {
        return (segments[i].event, i);
      }
    }
    assert(false, 'No segment found for angle: $angle');
    return (config.events[config.sections[0].eventId], 0);
  }

  static List<({double start, double end, Event event})> calculateSegments(
    WheelConfig config,
  ) {
    final List<({double start, double end, Event event})> segments = [];

    final int totalSize = config.totalSize;
    final List<double> segmentSizes = config.sections
        .map((section) => section.size / totalSize)
        .toList();

    double start = 0;

    for (int i = 0; i < segmentSizes.length; i++) {
      segments.add((
        start: start,
        end: start + segmentSizes[i],
        event: config.events[config.sections[i].eventId],
      ));

      start += segmentSizes[i];
    }

    return segments;
  }
}

/// Painter class that draws the wheel and the pointer.
class _WheelPainter extends CustomPainter {
  final WheelConfig config;

  /// The current angle of the wheel, 0 means, that the first segment starts
  /// at the top, 0.5 means the first segment starts at the bottom.
  final double angle;
  final TextPainter _textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );

  _WheelPainter(this.config, this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.shortestSide / 2;
    final Offset center = size.center(Offset.zero);

    final segments = WheelPaint.calculateSegments(config);

    final Paint paint = Paint()..style = PaintingStyle.fill;

    for (final segment in segments) {
      final paintStart = (angle + segment.start) * 2 * pi - pi / 2;
      final segmentSize = (segment.end - segment.start) * 2 * pi;
      paint.color = segment.event.color;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        paintStart,
        segmentSize,
        true,
        paint,
      );

      // Draw segment label
      final double textAngle = paintStart + segmentSize / 2;
      _textPainter.text = TextSpan(
        text: segment.event.name,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      );
      _textPainter.layout();
      final double x =
          center.dx + (radius * 0.7) * cos(textAngle) - _textPainter.width / 2;
      final double y =
          center.dy + (radius * 0.7) * sin(textAngle) - _textPainter.height / 2;
      _textPainter.paint(canvas, Offset(x, y));
    }

    final Path pointer = Path()
      ..moveTo(center.dx, center.dy - radius + 18)
      ..lineTo(center.dx - 12, center.dy - radius - 10)
      ..lineTo(center.dx + 12, center.dy - radius - 10)
      ..close();
    canvas.drawPath(pointer, paint..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant _WheelPainter old) {
    return old.angle != angle || old.config != config;
  }
}
