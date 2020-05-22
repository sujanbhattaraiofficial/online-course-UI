import 'dart:async';

import 'package:flutter/material.dart';

class DelayedAnimation extends StatefulWidget {
  final Widget child;
  final int delayDuration;
  final double anioffsetX;
  final double anioffsetY;
  final int aniDuration;
  // static bool isAniCompleted = false;

  const DelayedAnimation(
      {this.delayDuration,
      this.anioffsetX,
      @required this.child,
      this.anioffsetY,
      this.aniDuration});

  @override
  _DelayedAnimationState createState() => _DelayedAnimationState();
}

class _DelayedAnimationState extends State<DelayedAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animationOffset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.aniDuration));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _controller);
    _animationOffset = Tween<Offset>(
            begin: Offset(widget.anioffsetX, widget.anioffsetY),
            end: Offset.zero)
        .animate(curve);

    if (widget.delayDuration == null) {
      _controller.forward();
    } else {
      Timer(Duration(milliseconds: widget.delayDuration), () {
        _controller.forward();
      });
    }
    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     setState(() {
    //       DelayedAnimtion.isAniCompleted = true;
    //     });
    //   } else {
    //     setState(() {
    //       DelayedAnimtion.isAniCompleted = false;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animationOffset,
        child: widget.child,
      ),
      opacity: _controller,
    );
  }
}
