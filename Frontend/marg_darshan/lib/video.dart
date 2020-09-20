import 'package:flutter/material.dart';
import './src/pages/index.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexPage(),
    );
  }
}

class Video1 extends StatefulWidget {
  @override
  _Video1State createState() => _Video1State();
}

class _Video1State extends State<Video1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
