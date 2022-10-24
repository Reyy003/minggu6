import 'package:minggu6/register.dart';
import 'package:minggu6/HomePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          Container(
            margin: EdgeInsets.only(left: 15.0, right: 10),
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                  hintText: "masukkan username", fillColor: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0, right: 10),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "password", fillColor: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0, right: 5.0),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 50.0,
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                String usrname = usernameController.text;
                String pass = passwordController.text;
                if (usrname == "admin" && pass == "23456") {
                  print("username dan password benar");
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("username dan password benar")));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home()),
                  );
                } else {
                  print("username dan password salah");
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("username dan password salah")));
                }
                print("data username : $usrname data paswword : $pass");
                print("tombol diklik");
              },
              child: Text("Submit"),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 15.0, right: 5.0),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 50.0,
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
              child: Text("Register"),
            ),
          )
        ]),
      ),
    );
  }
}
