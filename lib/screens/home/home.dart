// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training41KahveniSecApp/models/order.dart';
import 'package:training41KahveniSecApp/screens/home/order_list.dart';
import 'package:training41KahveniSecApp/screens/home/settings_form.dart';
import 'package:training41KahveniSecApp/services/auth.dart';
import 'package:training41KahveniSecApp/services/database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void ayarlarPaneliniGoster() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingForm(),
            );
          });
    }

    return StreamProvider<List<Siparis>>.value(
      value: DatabaseService().siparisler,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(223, 186, 105, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(90, 46, 46, 1),
          title: Text(
            "Anasayfa",
            style: TextStyle(color: Color.fromRGBO(255, 254, 223, 1)),
          ),
          actions: [
            FlatButton.icon(
                onPressed: () => ayarlarPaneliniGoster(),
                icon: Icon(Icons.settings,
                    color: Color.fromRGBO(255, 254, 223, 1)),
                label: Text("Ayarlar",
                    style: TextStyle(color: Color.fromRGBO(255, 254, 223, 1)))),
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(
                  Icons.person_outline,
                  color: Color.fromRGBO(255, 254, 223, 1),
                ),
                label: Text("Çıkış",
                    style: TextStyle(color: Color.fromRGBO(255, 254, 223, 1)))),
          ],
        ),
        body: SiparisList(),
      ),
    );
  }
}
