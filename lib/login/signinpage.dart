// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pawcare/api/apis.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 300, 18, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    key: ValueKey('email'),
                    decoration: InputDecoration(hintText: 'Enter your email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid email';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        email = value!;
                      });
                    },
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    decoration:
                        InputDecoration(hintText: 'Enter your Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid password';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value!;
                      });
                    },
                  ),
                  loggedIn == true
                      ? ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              APIs.signIn(email, password, context);
                            }
                          },
                          child: Text('Sign In'))
                      : ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              APIs.signUp(email, password, context);
                            }
                          },
                          child: Text('Sign Up'))
                ],
              ),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    loggedIn = true;
                  });
                },
                child: Text('Sign in')),
          ],
        ),
      ),
    );
  }
}
