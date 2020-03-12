import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/batman_shows.dart';
import 'package:flutter_learn/screens/login.dart';
import 'package:flutter_learn/screens/randomList.dart';
import 'package:flutter_learn/screens/columnStyle.dart';
import 'package:flutter_learn/screens/show_detail.dart';
import 'package:uni_links/uni_links.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krishna',
      home: StreamBuilder(
        stream: getUriLinksStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Deep Link Test'),
                centerTitle: true,
              ),
              body: Center(
                child: Text(snapshot.data.toString()),
              ),
            );
          } else {
            return Login();
          }
        },
      ),
      onGenerateRoute: _routes(),
      theme: _appTheme(),
    );
  }

  ThemeData _appTheme() {
    return ThemeData(
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
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case '/BatmanShows':
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
