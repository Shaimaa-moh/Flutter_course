import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'AppUser.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user obj based on firebase user
  AppUser? _userFromFirebase(FirebaseUser user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<AppUser?> get user {
    {
      return _auth.onAuthStateChanged.map(
          (FirebaseUser user) => _userFromFirebase(user)); //map to our user
      //.map(_userFromFirebase(user));
    }
  }

  Future register(String email, String pw) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: pw);
      FirebaseUser user = authResult.user;
      return _userFromFirebase;
    } catch (e) {
      print(e.toString());
      return null; //if it fails
    }
  }

  Future signInAnom() async {
    try {
      AuthResult authResult = await _auth.signInAnonymously();
      FirebaseUser user = authResult.user;
      return _userFromFirebase;
    } catch (e) {
      print(e.toString());
      return null; //if it fails
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
      return null;
    } catch (e) {
      debugPrint("$e");
      return e;
    }
  }
}
