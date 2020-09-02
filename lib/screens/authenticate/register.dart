import 'package:flutter/material.dart';
import 'package:training41KahveniSecApp/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleSayfa;
  Register({this.toggleSayfa});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();

  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(223, 186, 105, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(90, 46, 46, 1),
        elevation: 0.0, // gölgelik
        title: Text("Üye Olunuz"),
        centerTitle: true,
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleSayfa();
              },
              icon: Icon(Icons.person, color: Color.fromRGBO(255, 254, 223, 1)),
              label: Text("Giriş Yap",
                  style: TextStyle(color: Color.fromRGBO(255, 254, 223, 1))))
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(icon: Icon(Icons.email)),
                  validator: (val) =>
                      val.isEmpty ? "Lütfen mail adresinizi giriniz" : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                    Icons.vpn_key,
                    color: Color.fromRGBO(90, 46, 46, 1),
                  )),
                  validator: (val) =>
                      val.length < 6 ? "Parola en az 6 karakter olmalı" : null,
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
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        // print("$email ve $password");
                        dynamic sonuc =
                            await _authService.register(email, password);
                        if (sonuc == null) {
                          setState(() {
                            error =
                                "Lütfen geçerli bir mail adresi ya da parola giriniz.";
                          });
                        }
                      }
                    }),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  error,
                  style: TextStyle(fontSize: 15.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
