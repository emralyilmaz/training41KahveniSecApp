import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // _auth nesnesi ile içerisindeki dosyalara erişim sağlanabilir.

  Future signInAnonim() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
