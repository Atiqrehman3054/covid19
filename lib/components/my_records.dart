import 'package:flutter/material.dart';

class MyRecrods extends StatelessWidget {

  final String title , value ;

  MyRecrods({@required this.title ,@required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),
          ],
        ),
        Divider()
      ],
    );
  }
}
