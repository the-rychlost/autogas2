// Main Page

import 'package:autogas/home.dart';
import 'package:autogas/level.dart';
import 'package:autogas/login.dart';
import 'package:autogas/mainpage.dart';
import 'package:autogas/profile.dart';
import 'package:autogas/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mainpage(),
      routes: {
        'login': (context) => LoginPage(),
        'signup': (context) => RegPage(),
        'home' : (context) => MyHomePage(),
        'profile': (context) => MyProfile(),
        'level': (context) => GasLevel(),
      },
    );
  }
}