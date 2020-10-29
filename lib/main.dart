import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  runApp(MaterialApp(
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
  ));
}

