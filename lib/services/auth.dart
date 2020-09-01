import 'package:firebase_auth/firebase_auth.dart';
import 'package:training41KahveniSecApp/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // _auth nesnesi ile içerisindeki dosyalara erişim sağlanabilir.

  Kullanici _firebasedenGelenKullanici(User kullanici) {
    return kullanici != null ? Kullanici(uid: kullanici.uid) : null;
  }

  Future signInAnonim() async {
    try {
      UserCredential result = await _auth.signInAnonymously(); // AuthResult
      User user = result.user; // FirebaseUser

      return _firebasedenGelenKullanici(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
