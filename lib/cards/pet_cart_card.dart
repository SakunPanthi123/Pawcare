import 'package:flutter/material.dart';
import 'package:pawcare/models/item_model.dart';

class CartItem extends StatelessWidget {
  final Product product;
  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Image(image: NetworkImage(product.imgUrl)),
          Text(product.title),
          Text(product.price.toString()),
          Text(product.description),
        ],
      ),
    );
  }
}
