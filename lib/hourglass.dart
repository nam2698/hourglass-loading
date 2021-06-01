import 'package:flutter/material.dart';
import 'package:hourglass_loading/hourglass_painter.dart';

class Hourglass extends StatefulWidget {
  final double size;

  const Hourglass({Key? key, this.size = 24}) : super(key: key);

  @override
  _HourglassState createState() => _HourglassState();
}

class _HourglassState extends State<Hourglass> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        painter: HourglassPainter(),
      ),
    );
  }
}
