import 'package:flutter/material.dart';

class TextAnimation extends StatefulWidget {
  final String title;
  final String subtitle;
  final AnimationController animationController;
  const TextAnimation({Key key, @required this.title, @required this.subtitle, @required this.animationController}) : super(key: key);
  @override
  _TextAnimationState createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation opacityTitle;
  Animation opacitySubtitle;
  Animation translateTitle;
  Animation translateSubTitle;

  void initAnimation(){
    animationController = widget.animationController;
    translateTitle = AlignmentTween(begin: Alignment.bottomCenter,end: Alignment.topCenter).animate(CurvedAnimation(parent: animationController,curve: Interval(0.0, 0.5)));
    opacityTitle = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: animationController,curve: Interval(0.4, 0.6)));
    translateSubTitle = AlignmentTween(begin: Alignment.center,end: Alignment.topCenter).animate(CurvedAnimation(parent: animationController,curve: Interval(0.3,0.8)));
    opacitySubtitle = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: animationController,curve: Interval(0.5, 0.8)));
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: AnimatedBuilder(
         animation: animationController,
          builder: (context, child) {
            return Stack(children: <Widget>[

                    Align(
                      alignment: translateTitle.value,
                      child: Opacity(
                        opacity: opacityTitle.value,
                        child: Text(widget.title,style: TextStyle(color: Colors.white,fontSize: 20),))),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Align(
                        alignment: translateSubTitle.value,
                        child: Opacity(
                          opacity: opacitySubtitle.value,
                          child: Text(widget.subtitle,style: TextStyle(color: Colors.white,fontSize: 20),))),
                    )

              

            ],);
          }
        ),
      ),
    );
  }
}