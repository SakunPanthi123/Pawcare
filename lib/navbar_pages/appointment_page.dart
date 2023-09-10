// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawcare/cards/pet_cart_card.dart';
import 'package:pawcare/providers/cart_item_provider.dart';
import 'package:pawcare/providers/product_provider.dart';
import 'package:provider/provider.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final currentId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Schedules'),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(currentId)
              .collection('appointments')
              .orderBy(
                'time',
                descending: false,
              )
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return (Text(''));
            }
            return snapshot.data == null
                ? Text('No data')
                : SizedBox(
                    height: 500,
                    child: ListView(
                      children: snapshot.data!.docs
                          .map(
                            (document) => Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16.0),
                                  margin: EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.blue, // Background color
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: Offset(0, 2), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Icon(
                                              Icons.calendar_today,
                                              size: 24.0,
                                              color: Colors
                                                  .white, // Calendar icon color
                                            ),
                                          ),
                                          Text(
                                            document.id,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white, // Text color
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 16, 0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(currentId)
                                              .collection('appointments')
                                              .doc(document.id)
                                              .delete();
                                        },
                                        child: Text('Done'),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  );
          },
        ));
  }
}
