import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppingapp/Services/Auth.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "";
  String password = "";

  final Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //no3 el app andriod uses this package , cupertino for ios
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkBlue,
        ),
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
              // return white screen
              appBar: AppBar(
                leading: const BackButton(),
                backgroundColor: Colors.blue,
                title: const Center(child: Text("this is my first app")),
                bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.login), text: "sign in"),
                    Tab(icon: Icon(Icons.app_registration), text: "register")
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                    color: Colors.white,
                  ),
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 200,
                      child: Image.network(
                          "https://logowik.com/content/uploads/images/flutter5786.jpg"),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        onSubmitted: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        onSubmitted: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          print("pressed");
                          var result = _auth.register(email, password);
                          if (result != null) {
                            Navigator.pushNamed(context, '/home');
                          } else {
                            print("not registered yet");
                            Navigator.pushNamed(context, '/signIn');
                          }
                        },
                        child: const Text('Sign in')),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      TextButton(
                          onPressed: () async {
                            dynamic re = await _auth.signInAnom();
                            if (re == null) {
                              print("error while signing in");
                            } else {
                              print("signed in success");
                              print(re.uid);
                            }
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ))
                    ],
                  ),
                ],
              )),
        ));
  }
}
