import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:librario/screens/auth/login/sign_in.dart';
import 'package:librario/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String email = '';
  // String name = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        title: Text('Rejestracja'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logowanie'),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset('assets/icons/logo.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 30, bottom: 15),
                  child: TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'Wpisz e-mail np. abc@gmail.com' : null,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey, width: 2)),
                        labelText: 'Email',
                        hintText: 'Wprowadź email'),
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                ),
                // Padding(
                //   //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                //   padding: EdgeInsets.all(15),
                //   child: TextFormField(
                //     validator: (val) => val!.length < 5 ? 'Wpisz imie' : null,
                //     decoration: InputDecoration(
                //         border: OutlineInputBorder(),
                //         labelText: 'Imię',
                //         hintText: 'Wprowadź swoje imię'),
                //     onChanged: (val) {
                //       setState(() => name = val);
                //     },
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 0, bottom: 30),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (val) => val!.length < 5 ? 'Wpisz hasło' : null,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey, width: 2)),
                        labelText: 'Hasło',
                        hintText: 'Wprowadź hasło'),
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() => error = 'Error register');
                        }
                      }
                    },
                    child: Text(
                      'Zarejestruj się',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
