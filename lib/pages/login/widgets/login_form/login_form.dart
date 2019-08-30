import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final AnimationController animationController;

  const LoginForm({Key key, @required this.animationController}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with SingleTickerProviderStateMixin{

  Animation opacity;

  void initAnimation(){
    opacity = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: widget.animationController,curve: Interval(0.5, 1.0)));
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      
      builder: (context, widget) {
        return Opacity(
          child: widget,
          opacity: opacity.value,
        );
      },
      child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
                Text(
                  "Login To Your Account",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[850],
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Username",
                                    hintStyle: TextStyle(color: Colors.grey[500]),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.grey[600],
                                    ),
                                    border: InputBorder.none),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[850],
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: TextFormField(
                                  obscureText: true,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey[500]),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.grey[600],
                                      ),
                                      suffixIcon: Icon(Icons.visibility,
                                          color: Colors.grey[600]),
                                      border: InputBorder.none))),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: FlatButton.icon(
                          color: Colors.black.withOpacity(0.2),
                          icon: Text(
                            "Sign In  ",
                            style: TextStyle(color: Colors.white),
                          ),
                          label: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 13.0,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
