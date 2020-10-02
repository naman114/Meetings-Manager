import 'package:flutter/material.dart';

import 'homepage.dart';

const Color myBlue = Colors.blue;
const Color myWhite = Colors.white;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meetings Manager",
      theme: ThemeData(
        primarySwatch: myBlue,
      ),
      home: HomePage(),
    );
  }
}
