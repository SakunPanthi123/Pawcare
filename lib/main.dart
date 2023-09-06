// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pawcare/firebase_options.dart';
import 'package:pawcare/navbarscreen.dart';
import 'package:pawcare/signinpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavBarScreen();
          } else {
            return SignInPage();
          }
        }),
    theme: ThemeData(
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: Colors.red,
          ),
          bodyMedium: TextStyle(
            color: Colors.red,
          ),
          bodySmall: TextStyle(
            color: Colors.red,
          ),
          labelMedium: TextStyle(
            color: Colors.red,
          ),
        ),
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.red,
        )),
  ));
}
