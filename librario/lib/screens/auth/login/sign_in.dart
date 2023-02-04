import 'package:flutter/material.dart';
import 'package:librario/screens/home/home.dart';
import 'package:librario/services/auth.dart';

class Sign_in extends StatefulWidget {
  final Function toggleView;
  Sign_in({required this.toggleView});
  @override
  _Sign_InState createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_in> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        title: Text('Logowanie'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Rejestracja'),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // SizedBox(height: 20),
              // TextFormField(
              //   onChanged: (val) {
              //     setState(() => email = val);
              //   },
              // ),

              // SizedBox(height: 20),
              // TextFormField(
              //   obscureText: true,
              //   onChanged: (val) {
              //     setState(() => password = val);
              //   },
              // ),

              // SizedBox(height: 25.0),
              // RaisedButton(
              //   color: Colors.blue[400],
              //   child: Text(
              //     'Zaloguj się',
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   onPressed: () async {
              //     print(password);
              //   },
              // )

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
                    left: 15.0, right: 15.0, top: 30, bottom: 0),
                child: TextFormField(
                  validator: (val) => val!.isEmpty ? 'Wpisz e-mail' : null,
                  autofocus: false,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey, width: 2)),
                      labelText: 'E-mail',
                      hintText: 'Wpisz e-mail'),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 30),
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
                      hintText: 'Wpisz hasło'),
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
                      dynamic result =
                          await _auth.signMailPassword(email, password);
                      if (result == null) {
                        setState(() => error = 'Error login');
                      }
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
