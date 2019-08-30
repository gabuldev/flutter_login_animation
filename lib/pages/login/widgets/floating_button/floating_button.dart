import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:login_animation/pages/login/widgets/floating_button/floating_button_bloc.dart';

class FloatingButtonAnimated extends StatefulWidget {


  const FloatingButtonAnimated({Key key}) : super(key: key);
  @override
  _FloatingButtonAnimatedState createState() => _FloatingButtonAnimatedState();
}

class _FloatingButtonAnimatedState extends State<FloatingButtonAnimated> with SingleTickerProviderStateMixin{
 
 //? LOGIC 
  BlocFloatingButton bloc = BlocFloatingButton();
  StreamSubscription listenSelected;

//? ANIMATION FLOATING ACTION BUTTON
  AnimationController animationController;
  Animation rotate;
  Animation changeColor;
  Animation containerColor;
  Animation translate;


  void initAnimation(){
  

 //SPECIF CONTROLL FLOATING ACTION BUTTON
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    rotate = Tween(begin: 0.0,end: 2.356).animate(CurvedAnimation(parent: animationController,curve: Curves.decelerate));
    changeColor = ColorTween(begin: Colors.blue,end: Colors.red).animate(animationController);
    containerColor = ColorTween(begin: Colors.transparent,end: Colors.black54).animate(animationController);
    translate = Tween(begin: 0.0,end:1.0).animate(CurvedAnimation(parent: animationController,curve: Curves.decelerate));
  }

  @override
  void initState() {
    initAnimation();
    listenSelected = bloc.selected.listen((data){
        if(data == true){
          if(animationController.isDismissed)
            animationController.forward();
        }
        else{
          if(animationController.isCompleted)
          animationController.reverse();
        }
    }); 
     super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    listenSelected.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, widget) {
        return SizedBox(
          
            width: size.width,
            height: size.height,
            child: Stack(
              children: <Widget>[

                IgnorePointer(
                  ignoring: animationController.value > 0.2 ? false : true ,
                                  child: Container(
                      color: containerColor.value,
                    ),
                ),

        //CENTER
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 60*translate.value,
                left: size.width/2 - 25,
                
                child: FloatingActionButton(
                   backgroundColor: Colors.grey[800],
                   elevation: 0.0,
                  mini: true,
                  child: Icon(FontAwesomeIcons.facebookF,size: 13.0,),
                  onPressed: (){},
                ),
              ),
                    //RIGTH
           Positioned(
            bottom: 40*translate.value,
           
            left: (size.width/2 - 25)*(1+translate.value/3),
            child: FloatingActionButton(
              backgroundColor: Colors.grey[800],
              elevation: 0.0,
              mini: true,
              child: Icon(FontAwesomeIcons.google,size: 13.0,),
              onPressed: (){},
            ),
          ),

          //LEFT
           Positioned(
            bottom: 40*translate.value,
            
            right: (size.width/2 - 25)*(1+ translate.value/3),
            child: FloatingActionButton(
               backgroundColor: Colors.grey[800],
               elevation: 0.0,
              mini: true,
              child: Icon(Icons.add),
              onPressed: (){},
            ),
          ),

               

          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
               elevation: 0.0,
              backgroundColor: changeColor.value,
              child: Transform.rotate(
              angle: rotate.value,
              child: Icon(Icons.add)),
              onPressed: () {
              var value = bloc.selectedValue;
              value = !value;
              bloc.selectedIn.add(value);
              },
            ),
          )
            ],
          ),
        ),

              ],
            ),
          );
      }
    );
  }
}
