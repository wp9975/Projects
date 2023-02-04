import 'package:firebase_auth/firebase_auth.dart';

import 'package:librario/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object
  Users? _usersFromFirebaseUser(User? user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  // Anonymous Sing in

  Future singInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _usersFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sing in Email + pass

  Future signMailPassword(String? email, String? password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      User user = result.user!;
      return _usersFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print('error : ${e.code}');
      return null;
    }
  }

  // Register

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return _usersFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

//     try {
//   UserCredential result = await _auth.createUserWithEmailAndPassword(
//       email: email, password: password);
//   User user = result.user;
//   return _usersFromFirebaseUser(user);
//  } catch (e) {
//   print(e.toString());
// }
//   }

  // Sing out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // auth change user stream
  Stream<Users?> get user {
    return _auth.authStateChanges().map(_usersFromFirebaseUser);
  }
}
