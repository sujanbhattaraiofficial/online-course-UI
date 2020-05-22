import 'dart:async';

import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  final Widget child;
  final int delayDuration;
  final int aniDuration;
  // static bool isAniCompleted = false;

  const ScaleAnimation(
      {this.delayDuration, @required this.child, this.aniDuration});

  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.aniDuration));
    final curve =
        CurvedAnimation(curve: Curves.easeInToLinear, parent: _controller);


    _scale = Tween<double>(begin: 0.0, end: 1.0).animate(curve);

    if (widget.delayDuration == null) {
      _controller.forward();
    } else {
      Timer(Duration(milliseconds: widget.delayDuration), () {
        _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: widget.child,
    );
  }
}
