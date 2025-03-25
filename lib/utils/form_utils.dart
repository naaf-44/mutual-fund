import 'package:flutter/material.dart';
/// formUtils which contains the common functionalities used in the application widget.
class FormUtils {

  /// input decoration
  /// used multiple times by input widget.
  static InputDecoration inputDecoration({String labelText = ""}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    );
  }

  /// appBar used multiple time by the screen
  static AppBar appBar(String title, {bool showBackButton = false}) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Center(child: Text(title, style: TextStyle(color: Colors.white))),
      automaticallyImplyLeading: showBackButton,
      iconTheme: IconThemeData(color: Colors.white),

    );
  }
}