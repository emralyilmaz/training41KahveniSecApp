import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(223, 186, 105, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(90, 46, 46, 1),
        elevation: 0.0, // gölgelik
        title: Text("Giriş Yapınız"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
            disabledColor: Color.fromRGBO(255, 254, 223, 1),
            // raisebutton ile anonim giriş yyapılacak ve tek bir butona tıklaması yeterlidir.
            child: Text(
              "Misafir Giriş",
              style: TextStyle(color: Color.fromRGBO(90, 46, 46, 1)),
            ),
            onPressed: () {}),
      ),
    );
  }
}
