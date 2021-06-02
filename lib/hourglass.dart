import 'package:flutter/material.dart';
import 'package:hourglass_loading/hourglass_painter.dart';

class Hourglass extends StatefulWidget {
  final double size;

  const Hourglass({Key? key, this.size = 24}) : super(key: key);

  @override
  _HourglassState createState() => _HourglassState();
}

class _HourglassState extends State<Hourglass> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));

    _animationController.forward(from: 0.0);
    _animationController.addListener(() {
      setState(() {
        if (_animationController.status == AnimationStatus.completed) {
          Future.delayed(Duration(milliseconds: 2000), () {
            _animationController.forward(from: 0.0);
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 0.5).animate(new CurvedAnimation(
          parent: _animationController, curve: Curves.easeInOutBack)),
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: CustomPaint(
          painter: HourglassPainter(
              progress: Tween(begin: 0.0, end: 0.5)
                  .animate(new CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.easeInOutBack))
                  .value),
        ),
      ),
    );
  }
}

    // return RotationTransition(
    //   turns: Tween(begin: 0.0, end: 0.5).animate(new CurvedAnimation(
    //       parent: _animationController, curve: Curves.easeInOutBack)),
    //   child: SizedBox(
    //     width: widget.size,
    //     height: widget.size,
    //     child: CustomPaint(
    //       painter: HourglassPainter( 
    //           progress: Tween(begin: 0.0, end: 0.5)
    //               .animate(new CurvedAnimation(
    //                   parent: _animationController,
    //                   curve: Curves.easeInOutBack))
    //               .value),
    //     ),
    //   ),
    // );


    // return SizedBox(
    //   width: widget.size,
    //   height: widget.size,
    //   child: CustomPaint(
    //     painter: HourglassPainter(
    //         progress: Tween(begin: 0.0, end: 1.0)
    //             .animate(new CurvedAnimation(
    //                 parent: _animationController, curve: Curves.easeInCubic))
    //             .value),
    //   ),
    // );