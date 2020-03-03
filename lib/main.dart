import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/columnStyle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColumnStyle(),
      debugShowCheckedModeBanner: false,
    );
  }
}
