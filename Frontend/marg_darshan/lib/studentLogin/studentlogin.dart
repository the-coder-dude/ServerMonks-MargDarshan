import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marg_darshan/BottomNavigationBar/bottombar.dart';
import 'package:marg_darshan/studentLogin/Register/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  String name;
  String pwd;
  String token;

  signin(String email1, String passwd1) async {
    var url = 'https://careerapp-auth.herokuapp.com/authenticate';
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    Map body = {"email": email1, "password": passwd1};
    var jsonresponse;
    var res = await http.post(url, body: body);
    if (res.statusCode == 200) {
      jsonresponse = json.decode(res.body);

      print(res.statusCode);
      print(res.body);

      if (jsonresponse != null) {
        sharedPreference.setString("token", jsonresponse["token"]);
        token = jsonresponse["token"];
        signin1(token).then((val) {
          name = val.toString();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Bottom(
                        name: name,
                      )));
        });
      }
    } else {
      print(res.body);
    }
  }

  signin1<String>(String token1) async {
    var url = 'https://careerapp-auth.herokuapp.com/getinfo';
    String name1;
    //SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token1',
    });
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      name1 = jsonResponse['msg'];
      print(name1);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return name1.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Login",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text("SignUp",
                        style: GoogleFonts.poppins(
                            color: Hexcolor('959FBA'),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              "images/1.svg",
              width: MediaQuery.of(context).size.height / 8,
              height: MediaQuery.of(context).size.height / 4,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Hello There",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                  )),
            ),
            Text("Please Login",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
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
                      obscureText: true,
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
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 12,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  signin(_email.text, _pwd.text);
                },
                child: Text("Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                color: Hexcolor('#81D4FA'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
