import 'package:flutter/material.dart';

const inputDecoration = InputDecoration(
  hintText: "Email",
  fillColor: Color.fromRGBO(255, 254, 223, 1),
  filled: true,
  border: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(90, 46, 46, 1))),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(90, 46, 46, 1), width: 2)),
  icon: Icon(
    Icons.email,
    color: Color.fromRGBO(90, 46, 46, 1),
  ),
);
