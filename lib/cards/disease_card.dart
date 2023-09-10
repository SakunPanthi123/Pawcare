import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DiseaseCard extends StatelessWidget {
  final String title;
  final String details;
  final Color titleColor;
  final Color detailsColor;

  DiseaseCard({
    required this.title,
    required this.details,
    this.titleColor = Colors.blue,
    this.detailsColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              details,
              style: TextStyle(
                fontSize: 16,
                color: detailsColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection('appointments')
                          .doc('Get this shot: $title')
                          .set({'time': DateTime.now().millisecondsSinceEpoch});
                    },
                    child: Text('Add this to Schedules'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
