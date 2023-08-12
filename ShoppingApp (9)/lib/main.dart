import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoppingapp/Screens/Home.dart';
import 'package:shoppingapp/Screens/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoppingapp/Services/Auth.dart';
import 'package:shoppingapp/Services/AppUser.dart';
import 'package:shoppingapp/Wrapper.dart';
import 'package:shoppingapp/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/Screens/register.dart';
import 'package:shoppingapp/Screens/navBar.dart';
import 'package:shoppingapp/Screens/MyCartGUI.dart';
import 'shop.dart';
import 'package:shoppingapp/Widgets/shop_widget.dart';
import 'package:shoppingapp/Model/user.dart';
import 'package:shoppingapp/Screens/InMyCart.dart';
import 'Wrapper.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => authenticate(),
        '/home': (context) => wrapper(),
        '/signIn': (context) => SignIn(),
        '/regitser': (context) => register(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var rating = 0.0;
    return StreamProvider<AppUser?>.value(
      value: Auth().user,
      initialData: null,
      child: MaterialApp(
        home: wrapper(),
      ),
    );
  }
}
