import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:marg_darshan/Splashscreen/splash.dart';
import 'package:marg_darshan/studentLogin/studentlogin.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: Initial(),
    debugShowCheckedModeBanner: false,
  ));
}

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
          ),
          Center(child: SvgPicture.asset("images/logo.svg")),
          SizedBox(
            height: MediaQuery.of(context).size.height / 9,
          ),
          Text(
            "Please choose the way in which you\n         want to enter our universe",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 14,
            child: RaisedButton(
                elevation: 9,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Hexcolor('#81D4FA'),
                child: Center(
                  child: Text("Student",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 14,
            child: RaisedButton(
                elevation: 9,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Hexcolor('#81D4FA'),
                child: Center(
                  child: Text("Mentor",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}
