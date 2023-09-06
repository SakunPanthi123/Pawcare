// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pawcare/account_screen.dart';
import 'package:pawcare/appointmentscreen.dart';
import 'package:pawcare/dietscreen.dart';
import 'package:pawcare/homescreen.dart';
import 'package:pawcare/message.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int initial = 0;
  List screen = [
    HomeScreen(),
    AppointmentScreen(),
    MessageScreen(),
    DietScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
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
