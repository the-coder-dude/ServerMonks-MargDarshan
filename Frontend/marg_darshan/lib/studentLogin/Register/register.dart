import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../studentlogin.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  signin(String email1, String passwd1) async {
    var url = 'https://careerapp-auth.herokuapp.com/adduser';

    Map body = {"email": email1, "password": passwd1};
    var jsonresponse;
    var res = await http.post(url, body: body);
    if (res.statusCode == 200) {
      jsonresponse = json.decode(res.body);

      print(res.statusCode);
      print(res.body);

      if (jsonresponse != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } else {
      print(res.body);
    }
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 17,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Text("Login",
                        style: GoogleFonts.poppins(
                            color: Hexcolor('959FBA'),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("SignUp",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'images/1.jpg',
              filterQuality: FilterQuality.high,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height / 3.9,
            ),
            Text("Hello There",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,
                )),
            Text("Please SignUp",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Card(
                  elevation: 9,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 13,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "E-mail",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email)),
                      controller: _email,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Card(
                  elevation: 9,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 13,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock)),
                      controller: _pwd,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Card(
                  elevation: 9,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 13,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Name",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person)),
                      controller: _pwd,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 14,
              child: RaisedButton(
                onPressed: () {
                  signin(_email.text, _pwd.text);
                },
                child: Text(
                  "SignUp",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                color: Hexcolor('#81D4FA'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
