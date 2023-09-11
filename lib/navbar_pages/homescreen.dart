// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:pawcare/cards/petcard.dart';
import 'package:pawcare/navbar_pages/details_page.dart';
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
    List<String> categories = [];
    for (var i in productProvider.products) {
      if (!categories.contains(i.category)) {
        categories.add(i.category);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
        child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories[index],
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
                      itemBuilder: (BuildContext context, value) {
                        return productProvider.products[value].category ==
                                categories[index]
                            ? InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DetailsPage(
                                              product: productProvider
                                                  .products[value])));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child:
                                      PetCard(productProvider.products[value]),
                                ),
                              )
                            : Row();
                      },
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
