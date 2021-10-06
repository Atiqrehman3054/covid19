import 'package:flutter/material.dart';

class CountiresRecords extends StatefulWidget {

  String name ;
  CountiresRecords({@required this.name});
  @override
  _CountiresRecordsState createState() => _CountiresRecordsState();
}

class _CountiresRecordsState extends State<CountiresRecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
