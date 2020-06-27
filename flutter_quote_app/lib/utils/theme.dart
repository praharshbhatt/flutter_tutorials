import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: Colors.white,
    primaryColorDark: Colors.white,
    accentColor: Colors.black,

    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,

    buttonColor: Colors.black,

    //Theming for text
    textTheme: TextTheme(
      headline5: TextStyle(color: Colors.black, fontFamily: "BalsamiqSans"),
      headline4: TextStyle(color: Colors.black, fontFamily: "AbrilFatface"),
      headline3: TextStyle(color: Colors.black, fontFamily: "AbrilFatface"),
      headline2: TextStyle(color: Colors.black, fontFamily: "AbrilFatface"),
      headline1: TextStyle(color: Colors.black, fontFamily: "AbrilFatface"),
      headline6: TextStyle(color: Colors.black, fontFamily: "BalsamiqSans"),
      subtitle1: TextStyle(color: Colors.black, fontFamily: "BalsamiqSans"),
      button: TextStyle(color: Colors.black, fontFamily: "BalsamiqSans"),
      caption: TextStyle(color: Colors.black, fontFamily: "BalsamiqSans"),
      bodyText2: TextStyle(color: Colors.black, fontFamily: "BalsamiqSans"),
      bodyText1: TextStyle(color: Colors.black, fontFamily: "BalsamiqSans"),
    ),
  );
}
