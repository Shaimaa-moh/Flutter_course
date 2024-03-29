import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppingapp/Services/Auth.dart';
import 'package:shoppingapp/main.dart';
import 'package:shoppingapp/Screens//register.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  final Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //no3 el app andriod uses this package , cupertino for ios
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // return white screen
        body: Form(
          key: _formKey,
          child: Column(
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
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your email' : null,
                    onChanged: (value) {
                      setState(() => email = value);
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
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) =>
                        value!.length < 4 ? 'Weak Password' : null,
                    onChanged: (value) {
                      setState(() => password = value);
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result =
                            await _auth.SignInwithEmail(email, password);

                        if (result == null) {
                          setState(() {
                            error = 'can not sign in with those credentials';
                          });
                        }
                      }
                    },
                    child: const Text('Sign in')),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    dynamic re = await _auth.signInAnom();
                    if (re != null) {
                      print("error while signing in");
                    } else {
                      print("signed in success");
                      print(re.uid);
                    }
                  },
                  child: Text('sign in anonoumsly'),
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => register()));
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
