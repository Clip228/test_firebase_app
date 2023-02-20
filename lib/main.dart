import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase_app/CurrenciesListApp.dart';
import 'package:test_firebase_app/view/ListScreen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CurrenciesListApp());
}


