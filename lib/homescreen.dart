// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawcare/cards/petcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
            child: FutureBuilder(
                future:
                    FirebaseFirestore.instance.collection('petProducts').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return !snapshot.hasData && snapshot.data!.docs.isEmpty
                      ? Text('Error')
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          children: snapshot.data!.docs.map((document) {
                            Map<String, dynamic> products =
                                document.data() as Map<String, dynamic>;
                            return Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: PetCard(
                                title: products['title'],
                                price: products['price'],
                                description: products['description'],
                                imgURL: products['imgUrl'],
                              ),
                            );
                          }).toList(),
                        );
                }),
          ),
        ],
      )),
    );
  }
}
