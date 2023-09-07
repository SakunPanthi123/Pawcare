// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:pawcare/models/item_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  Future<void> reinitialize(List<Product> prods) async {
    products = prods;
    await Future.delayed(Duration(seconds: 1));
    notifyListeners();
  }
}
