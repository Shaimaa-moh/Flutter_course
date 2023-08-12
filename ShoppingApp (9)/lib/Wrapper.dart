import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoppingapp/Screens/Home.dart';
import 'Services/AppUser.dart';
import 'authenticate.dart';
import 'main.dart';

class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    if (user == null) {
      return authenticate();
    } else {
      return Home();
    }
  }
}
