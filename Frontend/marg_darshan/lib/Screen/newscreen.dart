import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Newscreen extends StatefulWidget {
  @override
  _NewscreenState createState() => _NewscreenState();
}

class _NewscreenState extends State<Newscreen> {
  List<String> description = [
    "Indian Institute of Technology Bombay is a public technical and \nresearch university located in Powai, Mumbai, India.\n IIT Bombay was founded in 1958. In 1961, the Parliament decreed IITs as Institutes of National Importance.",
    "Indian Institute of Technology Roorkee, formerly University of Roorkee and Thomason College of Civil Engineering,\n is a public technical and research university located in Roorkee, Uttarakhand, India."
  ];
  List<String> images = [
    "images/Ellipse 1.png",
    "images/Ellipse 2.png",
    "images/Ellipse 3.png",
    "images/Ellipse 4.png"
  ];
  List<String> name = [
    "Shayna Patil",
    "Abhinav Maharana",
    "Arjun Sharma",
    "Akshat Khanna"
  ];
  List<String> college = ["IIT Bombay", "IIT Roorkie"];
  List<String> images1 = ["images/college1.png", "images/college2.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.4,
            child: Stack(
              children: [
                Positioned(
                  bottom: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage(
                              "images/3.png",
                            ),
                            fit: BoxFit.cover)),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 20,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 4,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 15,
                                      child: Container(
                                        color: Colors.black12,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    25),
                                            CircleAvatar(
                                              backgroundImage: ExactAssetImage(
                                                  images[index]),
                                              radius: 50,
                                              backgroundColor: Colors.blue,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(name[index]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Positioned(
              right: 30,
              child: Text(
                "Featured Blogs",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Card(
                        elevation: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1,
                          height: MediaQuery.of(context).size.height / 1.5,
                          color: Colors.black12,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 33,
                                      backgroundImage:
                                          ExactAssetImage(images[index]),
                                    ),
                                    SizedBox(width: 40),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name[index],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          college[index],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    /*SizedBox(
                                      width: 60,
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.share),
                                        onPressed: () {})*/
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Image.asset(
                                images1[index],
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  description[index],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        "Upvote",
                                        style: TextStyle(
                                            color: Hexcolor('#81D4FA'),
                                            fontSize: 20),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        "Downvote",
                                        style: TextStyle(
                                            color: Hexcolor('#81D4FA'),
                                            fontSize: 20),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
