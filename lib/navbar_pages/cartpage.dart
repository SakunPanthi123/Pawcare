// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pawcare/cards/pet_cart_card.dart';
import 'package:pawcare/providers/cart_item_provider.dart';
import 'package:pawcare/providers/product_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartItemProvider cartProvider = Provider.of<CartItemProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: SizedBox(
        child: ListView(
          children: productProvider.products
              .where((e) => cartProvider.cart.contains(e.id))
              .map((e) => CartItem(product: e))
              .toList(),
        ),
      ),
    );
  }
}
