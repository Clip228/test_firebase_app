import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase_app/theme/theme.dart';
import 'package:test_firebase_app/view/DetailScreen.dart';
import 'package:test_firebase_app/view/ListScreen.dart';

class CurrenciesListApp extends StatelessWidget{
  const CurrenciesListApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen()
      },
      theme: theme,
    );
  }
}