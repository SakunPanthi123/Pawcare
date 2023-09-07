// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawcare/cards/petcard.dart';
import 'package:pawcare/models/item_model.dart';
import 'package:pawcare/providers/product_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 40, 18, 18),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Products to care your pet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 335,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productProvider.products.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: PetCard(productProvider.products[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
