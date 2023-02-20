import 'package:flutter/material.dart';

final theme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.greenAccent,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),
  dividerColor: Colors.black12,
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.cyan,
  textTheme: const TextTheme(bodyMedium: TextStyle(
    color: Colors.amber,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  ))
);