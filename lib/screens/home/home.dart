import 'package:flutter/material.dart';
import 'package:training41KahveniSecApp/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(223, 186, 105, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(90, 46, 46, 1),
        title: Text(
          "Anasayfa",
          style: TextStyle(color: Color.fromRGBO(255, 254, 223, 1)),
        ),
        actions: [
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.person_outline,
                color: Color.fromRGBO(255, 254, 223, 1),
              ),
              label: Text("Çıkış",
                  style: TextStyle(color: Color.fromRGBO(255, 254, 223, 1))))
        ],
      ),
    );
  }
}
