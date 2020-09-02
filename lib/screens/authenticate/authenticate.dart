import 'package:flutter/material.dart';
import 'package:training41KahveniSecApp/screens/authenticate/register.dart';
import 'package:training41KahveniSecApp/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool girisYap = true;
  void toggleSayfa() {
    setState(() => girisYap = !girisYap);
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text("Authenticate"),
    // );
    if (girisYap) {
      return SignIn(
        toggleSayfa: toggleSayfa,
      );
    } else {
      return Register(toggleSayfa: toggleSayfa);
    }
  }
}
