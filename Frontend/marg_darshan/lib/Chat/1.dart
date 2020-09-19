import 'package:flutter/material.dart';
import 'package:marg_darshan/Chat/2.dart';
import 'package:marg_darshan/Chat/chatmodel.dart';
import 'package:scoped_model/scoped_model.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ChatModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AllChatsPage(),
      ),
    );
  }
}
