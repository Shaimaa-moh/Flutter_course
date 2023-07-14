import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'dart:core';
import 'package:session7/services/WorldTime.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  List<WorldTime> locations = [
    WorldTime(location: 'Berlin', flag: 'berlin.jpg', url: 'Europe/Berlin'),
    WorldTime(location: 'Athens', flag: 'greece.jpg', url: 'Europe/Berlin'),
    WorldTime(location: 'London', flag: 'uk.jpg', url: 'Europe/London'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.jpg', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'usa.jpg', url: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'uk.jpg', url: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'south_korea.jpg', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.jpg', url: 'Asia/Jakarta'),
  ];
  void display_time(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('choose location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap: () {
                display_time(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage("assets/images/${locations[index].flag}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
