import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learningshop/constants.dart';
import 'package:learningshop/homepage.dart';
import 'package:learningshop/widgets/login_form.dart';
import 'package:learningshop/widgets/sign_up_form.dart';
import 'package:learningshop/widgets/socal_buttons.dart';

class LogingPage extends StatefulWidget {
  //
  //
  //const LoggingPage({ Key? key }) : super(key: key);

  @override
  _LogingPageState createState() => _LogingPageState();
}

class _LogingPageState extends State<LogingPage>
    with SingleTickerProviderStateMixin {
  //if we want to shoe our sign up then we set true
  bool _isShowSignUp = false;
  AnimationController _animationController;
  Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);

    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });

    _isShowSignUp
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //it provide us height and width
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Stack(
                children: [
                  //login
                  AnimatedPositioned(
                    duration: defaultDuration,
                    //we use 88% width for login
                    width: _size.width * 0.88, // 88%
                    height: _size.height,
                    left: _isShowSignUp ? -_size.width * 0.76 : 0, //0.76
                    child: Container(
                      color: login_bg,
                      child: LoginForm(),
                    ),
                  ),

                  //sign up
                  AnimatedPositioned(
                    duration: defaultDuration,
                    height: _size.height,
                    width: _size.width * 0.88,
                    left:
                        _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
                    child: Container(
                      color: signup_bg,
                      child: SignUpForm(),
                    ),
                  ),

                  // lets add logo

                   AnimatedPositioned(
                    duration: defaultDuration,
                    left: 0,
                    top: _size.height * 0.1, //10%
                    right:
                        _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white60,
                      child: AnimatedSwitcher(
                        duration: defaultDuration,
                        child: _isShowSignUp
                            ? SvgPicture.asset(
                                "asset/animation_logo.svg",
                                color: signup_bg,
                              )
                            : SvgPicture.asset(
                                "asset/animation_logo.svg",
                                color: login_bg,
                              ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      bottom: _size.height * 0.1, // 10%
                      width: _size.width,
                      right: _isShowSignUp
                          ? -_size.width * 0.06
                          : _size.width * 0.06,
                      child: SocalButtns()),

                  //Login Text

                  AnimatedPositioned(
                    duration: defaultDuration,
                    // when our sign up shows want login text to left center
                    bottom: _isShowSignUp
                        ? _size.height / 2 - 80
                        : _size.height * 0.3, // 30%

                    left: _isShowSignUp
                        ? 0
                        : _size.width * 0.44 - 80, // 0.88/2 = 0.44
                    child: AnimatedDefaultTextStyle(
                      duration: defaultDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: _isShowSignUp ? 20 : 32,
                        fontWeight: FontWeight.bold,
                        color: _isShowSignUp ? Colors.white : Colors.white70,
                      ),
                      child: Transform.rotate(
                        angle: -_animationTextRotate.value * pi / 180,
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (_isShowSignUp) {
                              updateView();
                            } else {
                              //login
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: defpaultPadding * 0.75),
                            width: 160,
                            //color: Colors.red,
                            child: Text(
                              "Log In".toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // sign up text

                  AnimatedPositioned(
                    duration: defaultDuration,
                    // when our sign up shows want login text to left center
                    bottom: !_isShowSignUp
                        ? _size.height / 2 - 80 // width is height
                        : _size.height * 0.3, // 30%

                    right: _isShowSignUp
                        ? _size.width * 0.44 - 80
                        : 0, // 0.88/2 = 0.44
                    child: AnimatedDefaultTextStyle(
                      duration: defaultDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: !_isShowSignUp ? 20 : 32,
                        fontWeight: FontWeight.bold,
                        color: _isShowSignUp ? Colors.white : Colors.white70,
                      ),
                      child: Transform.rotate(
                        angle: (90 - _animationTextRotate.value) * pi / 180,
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (_isShowSignUp) {
                              //signup
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            } else {
                              updateView();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: defpaultPadding * 0.75),
                            width: 160,
                            //color: Colors.red,
                            child: Text(
                              "Sign Up".toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
