import 'package:flutter/material.dart';
import 'package:login_animation/animations/text_animation.dart';

class CurvedContainer extends StatefulWidget {
  final AnimationController animationController;

  const CurvedContainer({Key key, @required this.animationController})
      : super(key: key);
  @override
  _CurvedContainerState createState() => _CurvedContainerState();
}

class _CurvedContainerState extends State<CurvedContainer>
    with SingleTickerProviderStateMixin {
  Animation heigth;
  Animation width;

  void initAnimation() {
    CurvedAnimation curvedAnimation = CurvedAnimation(parent: widget.animationController,curve: Interval(0.0, 0.45));
    heigth = Tween(
            begin: MediaQuery.of(context).size.height * 0.9,
            end: MediaQuery.of(context).size.height * 0.5)
        .animate(curvedAnimation);

    width = Tween(
            begin: MediaQuery.of(context).size.width * 0.9,
            end: MediaQuery.of(context).size.width * 0.4)
        .animate(curvedAnimation);
  }

  @override
  void didChangeDependencies() {
    initAnimation();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: AnimatedBuilder(
          animation: widget.animationController,
          builder: (context, child) {
            return Container(
              height: heigth.value,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF2A5EC8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextAnimation(
                    animationController: widget.animationController,
                    title: "Welcome To",
                    subtitle: "Affiliate system",
                  ),
                  Image.network(
                      "https://www.softprodigy.com/wp-content/uploads/2016/12/startup111.png",width: width.value,),
                ],
              ),
            );
          }),
      clipper: ClipperCurve(),
    );
  }
}

class ClipperCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.05, size.height * 0.9,
        size.width * 0.2, size.height * 0.9);
    path.lineTo(size.width * 0.8, size.height * 0.9);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.9, size.width, size.height);
    path.lineTo(size.width, size.height * 0.9);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
