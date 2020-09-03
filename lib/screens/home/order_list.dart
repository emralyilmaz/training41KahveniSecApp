import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SiparisList extends StatefulWidget {
  @override
  _SiparisListState createState() => _SiparisListState();
}

class _SiparisListState extends State<SiparisList> {
  @override
  Widget build(BuildContext context) {
    final siparisler = Provider.of<QuerySnapshot>(context);
    print(siparisler.docs);
    for (var doc in siparisler.docs) {
      print(doc.data());
    }
    return Container();
  }
}
