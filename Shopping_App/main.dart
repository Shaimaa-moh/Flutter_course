import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:helloworld/shop.dart';
import 'package:helloworld/shop_widget.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  List<Shop> shops = [
    product1,
    product2,
    product3,
    product4,
  ];
  Widget build(BuildContext context) {
    var rating = 0.0;
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkBlue,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              leading: const BackButton(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Center(
                  child: Text("Shopping app",
                      style: TextStyle(color: Colors.black)))),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: shops.map((p) => shop_widget(shop: p)).toList(),
              ),
            ),
          ),
        ));
  }
}