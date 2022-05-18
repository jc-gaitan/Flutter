import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppBasicTheme {
  static ThemeData getThemeData() {
    return ThemeData(
      fontFamily: "Gordita",
      primarySwatch: Colors.blue,

      //
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.blueAccent,
        elevation: 2.0,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
