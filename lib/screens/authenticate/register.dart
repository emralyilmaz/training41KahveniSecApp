import 'package:flutter/material.dart';
import 'package:training41KahveniSecApp/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(223, 186, 105, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(90, 46, 46, 1),
        elevation: 0.0, // gölgelik
        title: Text("Üye Olunuz"),
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
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true, // parola için
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(height: 50),
                RaisedButton(
                    color: Color.fromRGBO(90, 46, 46, 1),
                    child: Text(
                      "Üye Ol",
                      style: TextStyle(color: Color.fromRGBO(255, 254, 223, 1)),
                    ),
                    onPressed: () {
                      print("$email ve $password");
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
