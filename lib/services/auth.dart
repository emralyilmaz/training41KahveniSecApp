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

  Stream<Kullanici> get user {
    // stream ile sürekli firebase ile iletişim halinde kalınması sağlanıyor.
    return _auth.authStateChanges
        .call()
        .map((usr) => _firebasedenGelenKullanici(usr));
  }
}
