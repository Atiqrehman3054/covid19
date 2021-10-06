
import 'package:civid_tracker/screens/Api.dart';
import 'package:civid_tracker/screens/world_states_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Api(),
    );
  }
}
