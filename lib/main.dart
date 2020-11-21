import 'package:flutter/material.dart';
import 'package:staggered_anim/first_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      title: "Staggered Animation Demo.",
      home: FirstPage(),
    );
  }
}
