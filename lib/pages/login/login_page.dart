import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_animation/animations/scale_animation.dart';
import 'package:login_animation/pages/login/widgets/curved_container.dart/curved_container.dart';
import 'package:login_animation/pages/login/widgets/login_form/login_form.dart';

import 'widgets/floating_button/floating_button.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  var scaleAnimationKey = GlobalKey<ScaleAnimationState>(debugLabel: "ScaleAnimationFAB");
  
  AnimationController animationController;

  void initAnimation(){
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
  }

  void runAnimation(){
    animationController.forward();
      Timer(Duration(seconds: 2), (){
      var state = scaleAnimationKey.currentState;
      state.runAnimation();
    });
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
    return Material(
      color: Colors.grey[900],
      child: Stack(
        children: <Widget>[
          CurvedContainer(animationController: animationController,),  
          Align(
            alignment: Alignment.center,
            child: LoginForm(animationController: animationController,),
          ),
           ScaleAnimation(
             duration: Duration(milliseconds: 500),
             key: scaleAnimationKey,
             child: FloatingButtonAnimated()),
          AnimatedBuilder(
          animation: animationController,
          child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    child: Text("Login To Your Account",
                    
                    style: TextStyle(color: Colors.white,fontSize: 20.0),
                  
                    ),
                    onPressed: (){
                      runAnimation();
                    },
                  ),
                ),
              ),
            builder: (context, child) {
              return animationController.value > 0 ? Container(width: 0.0,height: 0.0,) : child;
            }
          )  
        ],
      ),
    );
  }
}