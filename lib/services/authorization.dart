import 'package:firebase_auth/firebase_auth.dart';
import '../services/users.dart';
// import 'package:firebase_flutter/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user object based on firebase user

  AppUser? _userFromFirebaseUser(User? user) {
    // ignore: unnecessary_null_comparison
    return user != null
        ? AppUser(
            Uid: user.uid,
            Fname: user.displayName,
            Lname: user.displayName,
            email: user.email,
            Uname: user.displayName)
        : null;
  }

  //auth change user stream
  Stream<AppUser?> get userStream {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? _user = result.user;
      return _userFromFirebaseUser(_user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential? result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential? result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      User? user = result.user;

      //create a new document for the user
      //  await databaseService(uid: user!.uid)
      //      .updateUserData('0', 'Lorem Ipsum', 100);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
