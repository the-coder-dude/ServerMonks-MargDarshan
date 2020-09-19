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
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: RaisedButton(
                              color: Colors.deepOrange,
                              child: Text(
                                "Request",
                              ),
                              onPressed: () {}),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: RaisedButton(
                              color: Colors.deepOrange,
                              child: Text(
                                "Chat",
                              ),
                              onPressed: () {
                                //friendClicked(friend);
                              }),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: RaisedButton(
                              color: Colors.deepOrange,
                              child: Text(
                                "Video",
                              ),
                              onPressed: () {}),
                        ),
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
