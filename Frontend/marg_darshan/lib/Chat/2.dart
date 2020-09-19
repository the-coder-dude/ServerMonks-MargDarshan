import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marg_darshan/Chat/3.dart';
import 'package:marg_darshan/Chat/chatmodel.dart';
import 'package:marg_darshan/Chat/user.dart';
import 'package:marg_darshan/global.dart';
import 'package:scoped_model/scoped_model.dart';

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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: ExactAssetImage(images2),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Text(
                            friend.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          college1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 4),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Text(
                            "Request",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            setState(() {
                              f = 1;
                            });
                          },
                          onDoubleTap: () {
                            setState(() {
                              f = 0;
                            });
                          },
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
                                    onTap: () {},
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
