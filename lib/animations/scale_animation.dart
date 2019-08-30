import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  final Duration duration;
  final Widget child;

  const ScaleAnimation({Key key, @required this.duration, @required this.child})
      : assert(child != null, duration != null),
        super(key: key);
  @override
  ScaleAnimationState createState() => ScaleAnimationState();
}

class ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation scale;


  void runAnimation(){
    animationController.forward();
  }  

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: widget.duration);
    scale = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.decelerate));
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        child: widget.child,
        builder: (context, widget) {
          return Transform.scale(scale: scale.value, child: widget);
        });
  }
}
