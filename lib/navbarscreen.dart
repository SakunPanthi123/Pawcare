// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pawcare/api/apis.dart';
import 'package:pawcare/models/item_model.dart';
import 'package:pawcare/navbar_pages/account_screen.dart';
import 'package:pawcare/navbar_pages/appointmentscreen.dart';
import 'package:pawcare/navbar_pages/dietscreen.dart';
import 'package:pawcare/navbar_pages/homescreen.dart';
import 'package:pawcare/navbar_pages/message.dart';
import 'package:pawcare/providers/cart_item_provider.dart';
import 'package:pawcare/providers/product_provider.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int initial = 0;
  List<String> carts = [];
  List<Product> prods = [];
  List screen = [
    HomeScreen(),
    AppointmentScreen(),
    MessageScreen(),
    DietScreen(),
    AccountScreen(),
  ];

  @override
  void initState() {
    getCart();

    super.initState();
  }

  getCart() async {
    carts = await Future.value(APIs.getProducts());
  }

  @override
  Widget build(BuildContext context) {
    CartItemProvider cartProvider = Provider.of<CartItemProvider>(context);

    cartProvider.reinitialize(carts);
    return Scaffold(
      body: screen[initial],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: initial,
        onTap: (value) {
          setState(() {
            initial = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Pet Care',
            icon: Icon(Icons.local_hospital),
          ),
          BottomNavigationBarItem(
            label: 'Appointment',
            icon: Icon(Icons.pending_actions),
          ),
          BottomNavigationBarItem(
            label: 'Message',
            icon: Icon(Icons.message),
          ),
          BottomNavigationBarItem(
            label: 'Diet',
            icon: Icon(Icons.dining_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
