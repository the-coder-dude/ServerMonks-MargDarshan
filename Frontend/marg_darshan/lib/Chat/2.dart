import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:marg_darshan/Chat/3.dart';
import 'package:marg_darshan/Chat/chatmodel.dart';
import 'package:marg_darshan/Chat/user.dart';
import 'package:marg_darshan/global.dart';
import 'package:marg_darshan/video.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class AllChatsPage extends StatefulWidget {
  @override
  _AllChatsPageState createState() => _AllChatsPageState();
}

class _AllChatsPageState extends State<AllChatsPage> {
  int f = 0;
  @override
  void initState() {
    super.initState();
    ScopedModel.of<ChatModel>(context, rebuildOnChange: false).init();
  }

  void friendClicked(User friend) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ChatPage(friend);
        },
      ),
    );
  }

  Widget buildAllChatList() {
    return ScopedModelDescendant<ChatModel>(
      builder: (context, child, model) {
        return ListView.builder(
          itemCount: model.friendList.length,
          itemBuilder: (BuildContext context, int index) {
            User friend = model.friendList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 7,
                  color: Hexcolor('#81D4FA'),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: ExactAssetImage(images2),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                friend.name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              college1,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 2.2),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        if (f == 0)
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 14,
                            child: RaisedButton(
                                onLongPress: () {
                                  setState(() {
                                    f = 0;
                                  });
                                },
                                elevation: 9,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Hexcolor('#81D4FA'),
                                child: Center(
                                  child: Text("Request ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ),
                                onPressed: () async {
                                  var url =
                                      'https://careerapp-auth.herokuapp.com/sendrequest';
                                  var res = await http.post(url);
                                  if (res.statusCode == 201) {
                                    showDialog(
                                        context: (context),
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                              "SMS Sent!\nPlease wait for mentor to respond",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            actions: [
                                              FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      f = 1;
                                                    });
                                                  },
                                                  child: Text(
                                                    "Okay",
                                                  ))
                                            ],
                                          );
                                        });
                                  }
                                }),
                          ),
                        if (f == 1)
                          Padding(
                            padding: const EdgeInsets.all(70.0),
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 9,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Video()));
                                    },
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.grey[100],
                                      child: Center(
                                        child: Icon(
                                            CupertinoIcons.video_camera_solid),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      friendClicked(friend);
                                    },
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.grey[100],
                                      child: Center(
                                        child: Icon(Icons.chat_bubble_outline),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: buildAllChatList(),
    );
  }
}
