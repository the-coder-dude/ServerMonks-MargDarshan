//import 'package:donate/Global/global.dart';
//import 'package:donate/GoogleAuth/google.dart';
//import 'package:donate/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_app_sigma/profile.dart';

class Profile extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Profile> {
  List<String> string1 = ["Content 1", "Content 2", "About us", "Logout"];
  List<String> subtitle = [
    "Change your primary Email & Mobile Number",
    " How is your Experience using Let's-Donate\n Write to us for any queries",
    "Who we are.Vision.Mission",
    "Logout from the app"
  ];
  List<Icon> icon = [
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.feedback,
      color: Colors.black,
    ),
    Icon(
      Icons.info,
      color: Colors.black,
    ),
    Icon(
      Icons.exit_to_app,
      color: Colors.black,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 350,
          color: Colors.black87,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                  ),
                  SizedBox(
                    width: 155,
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onPressed: null),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage("images/ellipse5.png"),
                      radius: 60,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Shanu Mishra\n Age: 20",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 35,
                        ),
                        onPressed: null),
                  ),
                  SizedBox(
                    width: 75,
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: null),
                      Text(
                        "Hello",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 75,
                  ),
                  IconButton(
                      icon: Icon(Icons.chat, color: Colors.white, size: 35),
                      onPressed: null),
                ],
              ),
              //SizedBox(height: 7),
            ],
          ),
        ),
        Expanded(
            child: Container(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 130,
                  child: Row(
                    children: [
                      IconButton(
                          icon: icon[index],
                          onPressed: () {
                            /*  if (index == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileApp()));
                            }*/
                          }),
                      Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Text(
                              string1[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            subtitle[index],
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
              itemCount: 4),
        ))
      ],
    ));
  }
}
