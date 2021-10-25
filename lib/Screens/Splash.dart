import 'dart:async';

import 'package:flutter/material.dart';

import 'InitialPage.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Color(0xff09B44C),
      body: Center(
        child: Image(
          image: AssetImage("assets/images/splash.jpg"),
          height: 250,
        ),
      ),
    );
  }

  _loadWidget() async {
    var _duration = Duration(seconds: 2);

    return Timer(_duration, navigationHome);
  }

  void navigationHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => InitialPage()));
  }
}
