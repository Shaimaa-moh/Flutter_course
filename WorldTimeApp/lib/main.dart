import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'loadData.dart';
import 'dart:convert';
import 'location.dart';
import 'dart:core';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => loadData(),
      '/home': (context) => MyHomePage(),
      '/location': (context) => location(),
      '/loadData': (context) => loadData(),
    }));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter World Time App';
  // This widget is the root of your application.
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  Map dummy = {};
  @override
  Widget build(BuildContext context) {
    if (dummy.isEmpty) {
      dummy = ModalRoute.of(context)?.settings.arguments as Map;
    } else {
      dummy = dummy;
    }
    print(dummy);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(' World Time App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    dummy['location'],
                    style: TextStyle(
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            dummy['time'],
            style: TextStyle(
              fontSize: 40.0,
              letterSpacing: 2.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    //override new data
                    dummy = {
                      'location': result['location'],
                      'flag': result['flag'],
                      'time': result['time'],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                ),
              ),
              Text('Tap to choose location'),
            ],
          ),
        ],
      ),
    );
  }
}
