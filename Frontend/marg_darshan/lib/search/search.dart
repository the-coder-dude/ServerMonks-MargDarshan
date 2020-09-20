import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:marg_darshan/Chat/1.dart';
import 'package:marg_darshan/entities.dart';
import 'package:marg_darshan/global.dart';

var data = List<Post>();
int f = 0;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> college = [
    "IISC Banglore",
    "Hanshraj College",
    "IIT Madras",
    "VIT Vellore",
    "IIT Delhi"
  ];
  List<String> name = [
    "Shubham Mehta",
    "Anoushka Bisht",
    "Prabhakar Singh",
    "Ajay Singh Chauhan",
    "Shurya  Singh"
  ];
  List<String> gender = ["Male", "Female", "Male", "Male", "Male"];
  List<String> images = [
    "images/profile1.jpeg",
    "images/profile2.jpeg",
    "images/profile3.jpg",
    "images/profile4.jpeg",
    "images/profile5.jpeg"
  ];
  List<String> images1 = [
    "images/profile6.jpg",
    "images/profile7.jpg",
  ];

  TextEditingController _search = TextEditingController();
  Future<List<Post>> signin1(String token1) async {
    String name1;
    final response = await http.get(
      'https://careerapp-auth.herokuapp.com/search/$token1',
    );
    if (response.statusCode == 200) {
      var rb = response.body;
      var jsonResponse = json.decode(rb) as List;
      List<Post> users = jsonResponse.map((i) => Post.fromJson(i)).toList();
      print(users);
      data = users;
    } else {
      throw Exception('Failed to load post');
    }
    return data;
  }

  void state1() {
    setState(() {
      f = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 14),
          Row(
            children: [
              SizedBox(width: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 1.5,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 16,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      onTap: () {
                        setState(() {
                          f = 0;
                        });
                      },
                      controller: _search,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search"),
                    ),
                  ),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    signin1(_search.text).then((value) => {
                          if (value != null) {state1()}
                        });
                  }),
            ],
          ),
          if (f == 0)
            Expanded(
                child: ListView.builder(
                    itemCount: name.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 29,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 6.3,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            ExactAssetImage(images[index]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Text(gender[index],
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white54)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(name[index],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(college[index],
                                            style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
          if (f == 1)
            Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            id3 = data[index].id;
                            name1 = data[index].name;
                            college1 = data[index].college;
                            images2 = images1[index];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 15,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 7,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                              ExactAssetImage(images1[index]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Text(data[index].gender,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white54)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(data[index].name,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(data[index].college,
                                              style: TextStyle(fontSize: 16)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data[index].name),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data[index].gender),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data[index].college),
                            )
                          ],
                        ),
                      );
                    }))
        ],
      ),
    );
  }
}
