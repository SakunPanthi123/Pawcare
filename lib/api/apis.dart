// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawcare/models/item_model.dart';
import 'package:pawcare/navbarscreen.dart';

class APIs {
  static signUp(String email, String password, String name, String age,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'age': age,
      });
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => NavBarScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static signIn(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => NavBarScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static Future<List<String>> getProducts() async {
    List<String> cartProducts = [];
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('ids')
        .get();

    for (var document in snapshot.docs) {
      cartProducts.add(document.id.toString());
    }
    return cartProducts;
  }

  static Future<List<Product>> products() async {
    List<Product> products = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('petProducts').get();

    for (var document in snapshot.docs) {
      Map<String, dynamic> petProducts =
          document.data() as Map<String, dynamic>;
      products.add(Product.fromJson(petProducts));
    }
    return products;
  }
}
