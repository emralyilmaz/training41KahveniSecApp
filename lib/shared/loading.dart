import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 254, 223, 1),
      child: SpinKitRing(
        color: Color.fromRGBO(90, 46, 46, 1),
        size: 50,
      ),
    );
  }
}
