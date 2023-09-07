// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pawcare/api/apis.dart';
import 'package:pawcare/firebase_options.dart';
import 'package:pawcare/models/item_model.dart';
import 'package:pawcare/navbarscreen.dart';
import 'package:pawcare/login/signinpage.dart';
import 'package:pawcare/providers/cart_item_provider.dart';
import 'package:pawcare/providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CartItemProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Product> prods = [];

  @override
  void initState() {
    super.initState();
    getProd();
  }

  getProd() async {
    prods = await Future.value(APIs.products());
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider prodProvider = Provider.of<ProductProvider>(context);
    prodProvider.reinitialize(prods);
    return MaterialApp(
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
    );
  }
}
