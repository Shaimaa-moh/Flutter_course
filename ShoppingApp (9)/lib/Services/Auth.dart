import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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

  Future register(String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user; //grab user from the result
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null; //if it fails can't register with email and pass
    }
  }

  Future SignInwithEmail(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user; //grab user from the result
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null; //if it fails can't register with email and pass
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
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
