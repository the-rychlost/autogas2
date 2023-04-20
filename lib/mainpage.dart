import 'package:autogas/home.dart';
import 'package:autogas/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Mainpage extends StatelessWidget {
  const Mainpage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return MyApp();
          }else{
            return LoginPage();
          }
        },
      ),
    );
  }
}
