import 'dart:convert';
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
    "IISC College",
    "Hanshraj",
    "Anna",
    "VIT Vellore",
    "IIT Delhi"
  ];
  List<String> name = [
    "Shubham",
    "Anoushka",
    "Prabhakar",
    "Ajay Singh",
    "Shurya  S"
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
              Card(
                elevation: 1.5,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 16,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          elevation: 15,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 7,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(name[index],
                                            style: TextStyle(fontSize: 16)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(college[index],
                                            style: TextStyle(fontSize: 16)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(gender[index],
                                            style: TextStyle(fontSize: 16)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        ExactAssetImage(images[index]),
                                  )
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
                            elevation: 15,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 7,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(data[index].name,
                                            style: TextStyle(fontSize: 16)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(data[index].gender,
                                            style: TextStyle(fontSize: 16)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(data[index].college,
                                            style: TextStyle(fontSize: 16)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.8,
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        ExactAssetImage(images1[index]),
                                  )
                                ],
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
