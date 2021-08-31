import 'package:flutter/material.dart';
import 'package:learningshop/Authentication/loggingpage.dart';
import 'package:learningshop/homepage.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LogingPage()));
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.cyan,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset("asset/s1.json"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ape Panthiya",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
