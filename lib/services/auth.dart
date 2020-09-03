import 'package:firebase_auth/firebase_auth.dart';
import 'package:training41KahveniSecApp/models/user.dart';
import 'package:training41KahveniSecApp/services/database.dart';

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
      print(user.uid);

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

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future register(String mail, String parola) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: mail, password: parola);

      User user = result.user;
      await DatabaseService(uid: user.uid)
          .veriGuncelle("yeni kullanıcı", "0", 0);
      return _firebasedenGelenKullanici(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future singIn(String mail, String parola) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: mail.trim(), password: parola.trim());

      User user = result.user;
      return _firebasedenGelenKullanici(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
