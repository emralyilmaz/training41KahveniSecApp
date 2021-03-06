import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training41KahveniSecApp/models/order.dart';
import 'package:training41KahveniSecApp/models/user.dart';

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

  List<Siparis> _snapshottanGelenSiparis(QuerySnapshot snap) {
    return snap.docs.map((doc) {
      var docFunc = doc.data();
      return Siparis(
        isim: docFunc['isim'] ?? "",
        seker: docFunc['seker'] ?? "0",
        koyuluk: docFunc['koyuluk'] ?? 0,
      );
    }).toList();
  }

  Stream<List<Siparis>> get siparisler {
    return siparisCollection.snapshots().map(
        _snapshottanGelenSiparis); // snapshots ile siparişler kısmı getiriliyor.
  }

  KullaniciVeriler _snapshottanGelenKullaniciVerileri(DocumentSnapshot snap) {
    return KullaniciVeriler(
      uid: uid,
      isim: snap.data()["isim"],
      seker: snap.data()["seker"],
      koyuluk: snap.data()["koyuluk"],
    );
  }

  Stream<KullaniciVeriler> get kullaniciVerileri {
    return siparisCollection
        .doc(uid)
        .snapshots()
        .map(_snapshottanGelenKullaniciVerileri);
  }
}
