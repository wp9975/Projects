import 'package:flutter/material.dart';
import 'package:librario/models/user.dart';
import 'package:librario/screens/auth/authenticate.dart';
import 'package:provider/provider.dart';

import 'auth/login/sign_in.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    if (user == null) {
      print("user is null, should show Authenticate()");
      return Authenticate();
    } else {
      return Home();
    }
  }
}
