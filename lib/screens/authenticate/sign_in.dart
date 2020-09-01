import 'package:flutter/material.dart';
import 'package:training41KahveniSecApp/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

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
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  cursorColor: Color.fromRGBO(90, 46, 46, 1),
                  onChanged: (val) {},
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true, // parola için
                  onChanged: (val) {},
                  cursorColor: Color.fromRGBO(90, 46, 46, 1),
                ),
                SizedBox(height: 20),
                RaisedButton(
                    color: Color.fromRGBO(90, 46, 46, 1),
                    child: Text(
                      "Giriş",
                      style: TextStyle(color: Color.fromRGBO(255, 254, 223, 1)),
                    ),
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
