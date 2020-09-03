import 'package:flutter/material.dart';
import 'package:training41KahveniSecApp/shared/contants.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sekerler = ["0", "1", "2", "3", "4"];

  String currentIsim;
  String currentSeker;
  int currentKoyuluk;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            "Ayarları Güncelleyebilirsiniz.",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: inputDecoration.copyWith(
                hintText: "İsim", icon: Icon(Icons.person)),
            validator: (val) => val.isEmpty ? "Lütfen isim giriniz" : null,
            onChanged: (val) => setState(() => currentIsim = val),
          ),
          SizedBox(
            height: 10.0,
          ),
          DropdownButtonFormField(
            items: sekerler.map((seker) {
              return DropdownMenuItem(
                value: seker,
                child: Text("$seker şeker"),
              );
            }).toList(),
            onChanged: (val) => setState(() => currentSeker = val),
            decoration: inputDecoration.copyWith(
                icon: Icon(Icons.format_color_fill,
                    color: Color.fromRGBO(90, 46, 46, 1))),
            value: currentSeker ?? "0",
          ),
          Slider(
            value: (currentKoyuluk ?? 100).toDouble(),
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) => setState(() => currentKoyuluk = val.round()),
            activeColor: Colors.brown[currentKoyuluk ?? 100],
            inactiveColor: Colors.brown[currentKoyuluk ?? 100],
          ),
          RaisedButton(
              color: Color.fromRGBO(90, 46, 46, 1),
              child: Text("Güncelle",
                  style: TextStyle(color: Color.fromRGBO(255, 254, 223, 1))),
              onPressed: () async {
                print(currentIsim);
                print(currentSeker);
                print(currentKoyuluk);
              })
        ],
      ),
    );
  }
}
