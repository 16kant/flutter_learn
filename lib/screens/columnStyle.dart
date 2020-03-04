import 'package:flutter/material.dart';
import '../components/text_section.dart';

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
          TextSection(
              title: 'Heading 1',
              body:
                  'sflksdjflsd fklsd flksdjflksdjf ldskjf sdlkjf lkdsjflksd flksd'),
          TextSection(
              title: 'Heading 2',
              body:
                  'sflksdjflsd fklsd flksdjflksdjf ldskjf sdlkjf lkdsjflksd flksd'),
          TextSection(
              title: 'Heading 3',
              body:
                  'sflksdjflsd fklsd flksdjflksdjf ldskjf sdlkjf lkdsjflksd flksd'),
          TextSection(
              title: 'Heading 4',
              body:
                  'sflksdjflsd fklsd flksdjflksdjf ldskjf sdlkjf lkdsjflksd flksd'),
          Container(
            color: Colors.red[200],
            child: Text('krishna'),
          ),
          Container(
            color: Colors.blue[200],
            child: Text('krishna'),
          ),
        ],
      ),
    );
  }
}
