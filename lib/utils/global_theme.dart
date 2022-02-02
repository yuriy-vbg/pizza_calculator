import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
      fontFamily: 'Railway',
      splashColor: Colors.yellow,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ).copyWith(
        secondary: Colors.lightGreen,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 30.0, color: Colors.white),
        bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'Hind', color: Colors.indigo),
      ),
    );
