import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training41KahveniSecApp/models/user.dart';
import 'package:training41KahveniSecApp/screens/wrapper.dart';
import 'package:training41KahveniSecApp/services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Kullanici>.value(
        // kullanıcıda bir değişiklik olup olmadığını stream sayesinde sürekli takip edecek,
        // provider sayesinde de her yerde erişilebilir olacak.
        value: AuthService().user,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Wrapper(),
        ));
  }
}
