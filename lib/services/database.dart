import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference siparisCollection = FirebaseFirestore.instance
      .collection("siparişler"); // Firestore yerine FirebaseFirestore yapıldı.

  Future veriGuncelle(String isim, String seker, int koyuluk) async {
    return await siparisCollection
        .doc(uid)
        .set({"seker": seker, "isim": isim, "koyuluk": koyuluk});
  }
}
