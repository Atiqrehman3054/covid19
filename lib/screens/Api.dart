import 'dart:convert';

import 'package:civid_tracker/models/model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class Api extends StatefulWidget {

  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        color: Colors.black,
        child: MaterialButton(
          onPressed: ()async{
            var respones = await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));

         print('response=${respones.body}');
          var data = jsonDecode(respones.body);
          covid atiq=covid.fromJson(data);


          print('atiq.active');


          },
          child: Text('Call Api',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
