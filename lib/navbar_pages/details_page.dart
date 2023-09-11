// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pawcare/models/item_model.dart';
import 'package:pawcare/providers/cart_item_provider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Product product;
  const DetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    CartItemProvider cartProvider = Provider.of<CartItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(widget.product.imgUrl),
              Text(
                widget.product.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rs ${widget.product.price.toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text(
                widget.product.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cartProvider.addToCart(widget.product.id);
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
