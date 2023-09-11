// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawcare/login/signinpage.dart';
import 'package:pawcare/navbar_pages/appointment_page.dart';
import 'package:pawcare/navbar_pages/cartpage.dart';
import 'package:pawcare/providers/cart_item_provider.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    CartItemProvider cartProvider = Provider.of<CartItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final details =
                        snapshot.data!.data() as Map<String, dynamic>;

                    return Column(
                      children: [Text(details['name']), Text(details['age'])],
                    );
                  }
                }),
            //cart
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => CartPage()));
                },
                child: Text('My Cart')),
            //appointments
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AppointmentPage()));
                },
                child: Text('My Schedules')),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                cartProvider.reinitialize([]);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => SignInPage()));
              },
              child: Text(
                'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
