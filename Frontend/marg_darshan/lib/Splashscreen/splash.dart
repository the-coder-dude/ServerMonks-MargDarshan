import 'package:flutter/material.dart';
import 'package:marg_darshan/main.dart';
import "package:custom_splash/custom_splash.dart";

class Initial extends StatefulWidget {
  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: CustomSplash(
        backGroundColor: Colors.black,
        imagePath: "images/Logo.png",
        animationEffect: 'zoom-in',
        logoSize: 200,
        home: First(),
        duration: 8800,
        type: CustomSplashType.StaticDuration,
      ),
    );
  }
}
