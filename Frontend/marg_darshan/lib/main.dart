import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:marg_darshan/studentLogin/studentlogin.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: First(),
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
            height: MediaQuery.of(context).size.height / 14,
          ),
          Center(
            child: Image.asset(
              "images/2.png", //image is added
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 2.5,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Please choose the way in which you\nwant to enter our universe",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 14,
            child: RaisedButton(
                elevation: 9,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
                    borderRadius: BorderRadius.circular(20)),
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
