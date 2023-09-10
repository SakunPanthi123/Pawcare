// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  TextEditingController aController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        title: Text(
          'Add Routines',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Here you can add schedules for your dog and cat.',
                style: TextStyle(
                  color: Colors.red, // Set text color to red
                  fontSize: 18.0, // Increase font size
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Add a schedule',
                              style: TextStyle(
                                fontSize: 18.0, // Increase font size
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: aController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .collection('appointments')
                                    .doc(aController.text)
                                    .set({
                                  'time': DateTime.now().millisecondsSinceEpoch
                                });
                                aController.text = '';
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  color: Colors
                                      .white, // Set button text color to white
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors
                                    .red), // Set button background color to red
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'Add New',
                  style: TextStyle(
                    color: Colors.white, // Set button text color to white
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Colors.red), // Set button background color to red
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
