import 'package:flutter/material.dart';

class FormUtils {
  static InputDecoration inputDecoration({String labelText = ""}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    );
  }

  static AppBar appBar(String title) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Center(child: Text(title, style: TextStyle(color: Colors.white))),
    );
  }
}