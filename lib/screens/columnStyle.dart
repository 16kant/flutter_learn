import 'package:flutter/material.dart';

class ColumnStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColumnStyle'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            constraints: BoxConstraints.expand(
              height: 200.0,
            ),
            color: Colors.grey,
            child: Image.asset(
              'images/screenshot.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.red[200],
            child: Text('krishna'),
          ),
          Container(
            color: Colors.blue[200],
            child: Text('krishna'),
          ),
          Container(
            color: Colors.orange[200],
            child: Text('krishna'),
          ),
          Container(
            color: Colors.green[200],
            child: Text('krishna'),
          ),
        ],
      ),
    );
  }
}
