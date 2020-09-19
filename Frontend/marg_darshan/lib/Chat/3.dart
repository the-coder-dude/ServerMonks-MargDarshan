import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:marg_darshan/Chat/chatmodel.dart';
import 'package:marg_darshan/Chat/message.dart';
import 'package:marg_darshan/Chat/user.dart';
import 'package:scoped_model/scoped_model.dart';

class ChatPage extends StatefulWidget {
  final User friend;
  ChatPage(this.friend);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController textEditingController = TextEditingController();

  Widget buildSingleMessage(Message message) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      child: Card(
        elevation: 9,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 60,
          child: Container(
            width: MediaQuery.of(context).size.width / 15,
            color: Colors.transparent,
            alignment: message.senderID == widget.friend.chatID
                ? Alignment.centerLeft
                : Alignment.centerRight,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            child: Text(
              message.text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChatList() {
    return ScopedModelDescendant<ChatModel>(
      builder: (context, child, model) {
        List<Message> messages =
            model.getMessagesForChatID(widget.friend.chatID);

        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              return buildSingleMessage(messages[index]);
            },
          ),
        );
      },
    );
  }

  Widget buildChatArea() {
    return ScopedModelDescendant<ChatModel>(
      builder: (context, child, model) {
        return Container(
          height: MediaQuery.of(context).size.height / 7,
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: textEditingController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type a message",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(width: 10.0),
              FloatingActionButton(
                backgroundColor: Hexcolor('#81D4FA'),
                onPressed: () {
                  model.sendMessage(
                      textEditingController.text, widget.friend.chatID);
                  textEditingController.text = '';
                },
                elevation: 0,
                child: Icon(Icons.send),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(widget.friend.name),
        backgroundColor: Hexcolor('#81D4FA'),
      ),
      body: ListView(
        children: <Widget>[
          buildChatList(),
          buildChatArea(),
        ],
      ),
    );
  }
}
