import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String title;
  final String body;

  TextSection({@required this.title, @required this.body});

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(16, 32, 16, 4),
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: Text(body),
        ),
      ],
    );
  }
}
