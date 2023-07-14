import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'dart:core';
import 'package:session7/services/WorldTime.dart';

class loadData extends StatefulWidget {
  const loadData({Key? key}) : super(key: key);

  @override
  State<loadData> createState() => _loadDataState();
}

class _loadDataState extends State<loadData> {
  void setup() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();
    print('hello from init state');
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(50.0),
      child: Text("loading...."),
    ));
  }
}
