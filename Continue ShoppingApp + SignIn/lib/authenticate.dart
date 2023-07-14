import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/Services/AppUser.dart';
import 'package:shoppingapp/SignIn.dart';

class authenticate extends StatefulWidget {
  const authenticate({Key? key}) : super(key: key);

  @override
  State<authenticate> createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<AppUser>(context);
    //print(user);
    return Container(
      child: SignIn(),
    );
  }
}
