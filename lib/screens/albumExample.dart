// import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://api.tvmaze.com/search/shows?q=batman');

  print('response>>>');
  print(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    dynamic krishna = jsonDecode(response.body);
    print('krishna>>>');
    print(krishna);
    return Album.fromJson(krishna);
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  // final int userId;
  // final int id;
  // final String title;
  // final double score;

  final List<Map<String, dynamic>> shows;

  // Album({this.userId, this.id, this.title});
  Album(this.shows);

  factory Album.fromJson(List json) {
    List<Map<String, dynamic>> shows = json.map((show) {
      return {'name': show['show']['name']};
    }).toList();

    return Album(shows);
    // return Album(

    // userId: json['userId'],
    // id: json['id'],
    // title: json['title'],
    // );
  }
}

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Widget _buildSuggestions(List shows) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) {
          return Divider();
        }
        final int index = i ~/ 2;

        // if (index >= shows.length) {
        //   shows.addAll(generateWordPairs().take(10));
        // }
        return _buildRow(shows[index]['name']);
      },
    );
  }

  Widget _buildRow(String name) {
    // final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        name,
        // style: _biggerFont,
      ),
      // trailing: Icon(
      //   alreadySaved ? Icons.favorite : Icons.favorite_border,
      //   color: alreadySaved ? Colors.red : null,
      // ),
      // onTap: () => setState(() {
      //   if (alreadySaved) {
      //     _saved.remove(pair);
      //   } else {
      //     _saved.add(pair);
      //   }
      // }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print('shows>>>>>');
              print(snapshot.data.shows);
              _buildSuggestions(snapshot.data.shows);
              // return Text(snapshot.data.shows[0]['name'].toString());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
