import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartItemProvider extends ChangeNotifier {
  List<String> cart = [];

  void reinitialize(List<String> prods) {
    cart = prods;
  }

  Future<void> addToCart(String id) async {
    cart.add(id);
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('ids')
        .doc(id)
        .set({});

    notifyListeners();
  }

  Future<void> removefromCart(String id) async {
    cart.remove(id);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('ids')
        .doc(id)
        .delete();
    notifyListeners();
  }
}
