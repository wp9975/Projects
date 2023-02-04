import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:librario/models/user.dart';
import 'package:librario/screens/wrapper.dart';
import 'package:librario/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
