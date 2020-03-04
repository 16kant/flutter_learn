import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/albumExample.dart';
import 'package:flutter_learn/screens/randomList.dart';
import 'package:flutter_learn/screens/columnStyle.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
      onGenerateRoute: _routes(),
      theme: ThemeData(
        textTheme: TextTheme(
          title: TextStyle(fontFamily: 'IndieFlower'),
          body1: TextStyle(fontFamily: 'TradeWinds'),
        ),
      ),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      Widget screen;
      switch (settings.name) {
        case RandomWordsRoute:
          screen = ColumnStyle();
          break;
        case ColumnStyleRoute:
          screen = RandomWords();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
