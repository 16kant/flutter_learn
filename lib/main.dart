// import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/batman_shows.dart';
import 'package:flutter_learn/screens/login.dart';
import 'package:flutter_learn/screens/randomList.dart';
import 'package:flutter_learn/screens/columnStyle.dart';
import 'package:flutter_learn/screens/show_detail.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Login(),
      onGenerateRoute: _routes(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black87,
        ),
        textTheme: TextTheme(
          title: TextStyle(
            fontFamily: 'TradeWinds',
          ),
          body1: TextStyle(
            // fontFamily: 'IndieFlower',
            // fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case '/':
          screen = BatmanShows();
          break;
        case '/ShowDetail':
          screen = ShowDetail(arguments['id'], arguments['name']);
          break;
        case '/RandomWords':
          screen = RandomWords();
          break;
        case '/ColumnStyle':
          screen = ColumnStyle();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
