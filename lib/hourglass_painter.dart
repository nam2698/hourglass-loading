import 'package:flutter/material.dart';

class HourglassPainter extends CustomPainter {
  final Color lineColor;
  final Paint line;
  final Paint back;
  final Paint sand;
  final Color backgroundColor;
  final Color sandColor;
  final double progress;
  HourglassPainter(
      {this.lineColor = Colors.white,
      this.backgroundColor = Colors.grey,
      this.progress = 0,
      this.sandColor = Colors.orange})
      : line = Paint()
          ..color = lineColor
          ..style = PaintingStyle.stroke,
        back = Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.fill,
        sand = Paint()
          ..color = sandColor
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    _paintBack(canvas, size);
    // _paintSand(canvas, size);
    _paintLine(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  _paintLine(Canvas canvas, Size size) {
    line.strokeWidth = size.width * 0.075;
    double radius = size.width * 0.05;
    Path _path = new Path();

    _path.moveTo(size.width * 0.2, 0);
    _path.lineTo(size.width * 0.8 - radius, 0);
    _path.quadraticBezierTo(size.width * 0.8, 0, size.width * 0.8, radius);
    _path.lineTo(size.width * 0.8, size.height * 0.2);
    _path.arcToPoint(Offset(size.width * 0.6, size.height * 0.45),
        radius: Radius.circular(radius * 5));
    _path.quadraticBezierTo(size.width * 0.5 + radius, size.height * 0.5,
        size.width * 0.6, size.height * 0.55);
    _path.arcToPoint(Offset(size.width * 0.8, size.height * 0.8),
        radius: Radius.circular(radius * 5));
    _path.lineTo(size.width * 0.8, size.height - radius);
    _path.quadraticBezierTo(
        size.width * 0.8, size.height, size.width * 0.8 - radius, size.height);
    _path.lineTo(size.width * 0.2 + radius, size.height);
    _path.quadraticBezierTo(
        size.width * 0.2, size.height, size.width * 0.2, size.height - radius);
    _path.lineTo(size.width * 0.2, size.height * 0.8);
    _path.arcToPoint(Offset(size.width * 0.4, size.height * 0.55),
        radius: Radius.circular(radius * 5));
    _path.quadraticBezierTo(size.width * 0.5 - radius, size.height / 2,
        size.width * 0.4, size.height * 0.45);
    _path.arcToPoint(Offset(size.width * 0.2, size.height * 0.2),
        radius: Radius.circular(radius * 5));
    _path.lineTo(size.width * 0.2, radius);
    _path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.2 + radius, 0);
    _path.close();
    canvas.drawPath(_path, line);
  }

  _paintBack(Canvas canvas, Size size) {
    double radius = size.width * 0.05;
    Path _path = new Path();

    _path.moveTo(size.width * 0.2, 0);
    _path.lineTo(size.width * 0.8 - radius, 0);
    _path.quadraticBezierTo(size.width * 0.8, 0, size.width * 0.8, radius);
    _path.lineTo(size.width * 0.8, size.height * 0.2);
    _path.arcToPoint(Offset(size.width * 0.6, size.height * 0.45),
        radius: Radius.circular(radius * 5));
    _path.quadraticBezierTo(size.width * 0.5 + radius, size.height * 0.5,
        size.width * 0.6, size.height * 0.55);
    _path.arcToPoint(Offset(size.width * 0.8, size.height * 0.8),
        radius: Radius.circular(radius * 5));
    _path.lineTo(size.width * 0.8, size.height - radius);
    _path.quadraticBezierTo(
        size.width * 0.8, size.height, size.width * 0.8 - radius, size.height);
    _path.lineTo(size.width * 0.2 + radius, size.height);
    _path.quadraticBezierTo(
        size.width * 0.2, size.height, size.width * 0.2, size.height - radius);
    _path.lineTo(size.width * 0.2, size.height * 0.8);
    _path.arcToPoint(Offset(size.width * 0.4, size.height * 0.55),
        radius: Radius.circular(radius * 5));
    _path.quadraticBezierTo(size.width * 0.5 - radius, size.height / 2,
        size.width * 0.4, size.height * 0.45);
    _path.arcToPoint(Offset(size.width * 0.2, size.height * 0.2),
        radius: Radius.circular(radius * 5));
    _path.lineTo(size.width * 0.2, radius);
    _path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.2 + radius, 0);
    _path.close();
    canvas.drawPath(_path, back);
  }

  _paintSand(Canvas canvas, Size size) {
    double radius = size.width * 0.05;
    double height = (size.height * 0.2) * progress;
    Path _path = new Path();

    _path.moveTo(size.width * 0.2, size.height - height);
    _path.lineTo(size.width * 0.8, size.height - height);
    _path.lineTo(size.width * 0.8, size.height);
    _path.lineTo(size.width * 0.2, size.height);
    _path.close();
    canvas.drawPath(_path, sand);
  }
}
