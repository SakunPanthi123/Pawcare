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
  String name = '';
  String age = '';
  bool loggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 100, 18, 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: loggedIn == true
                      ? Column(
                          children: [
                            TextFormField(
                              key: ValueKey('email'),
                              decoration:
                                  InputDecoration(hintText: 'Enter your email'),
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
                              decoration: InputDecoration(
                                  hintText: 'Enter your Password'),
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
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    APIs.signIn(email, password, context);
                                  }
                                },
                                child: Text('Sign In')),
                          ],
                        )
                      : Column(
                          children: [
                            TextFormField(
                              key: ValueKey('name'),
                              decoration:
                                  InputDecoration(hintText: 'First Name'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a valid name';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  name = value!;
                                });
                              },
                            ),
                            TextFormField(
                              key: ValueKey('age'),
                              decoration:
                                  InputDecoration(hintText: 'Enter your Age'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a valid age';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  age = value!;
                                });
                              },
                            ),
                            TextFormField(
                              key: ValueKey('email'),
                              decoration:
                                  InputDecoration(hintText: 'Enter your email'),
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
                              decoration: InputDecoration(
                                  hintText: 'Enter your Password'),
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
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    APIs.signUp(
                                        email, password, name, age, context);
                                  }
                                },
                                child: Text('Sign Up'))
                          ],
                        ),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        loggedIn = loggedIn == true ? false : true;
                      });
                    },
                    child:
                        loggedIn == true ? Text('Sign Up') : Text('Sign In')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
