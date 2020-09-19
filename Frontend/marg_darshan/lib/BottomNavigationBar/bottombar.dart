import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:marg_darshan/Screen/newscreen.dart';
import 'package:marg_darshan/search/search.dart';

class Bottom extends StatefulWidget {
  final String name;
  const Bottom({Key key, this.name}) : super(key: key);
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index = 0;
  void tapped(int index1) {
    setState(() {
      index = index1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widget1 = [
      Newscreen(),
      Search() /* Profile()*/
    ];

    return Scaffold(
      body: widget1.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          unselectedItemColor: Colors.grey,
          elevation: 10,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Hexcolor('#81D4FA'),
          currentIndex: index,
          onTap: tapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ]),
    );
  }
}
