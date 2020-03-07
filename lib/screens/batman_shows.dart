import 'package:flutter/material.dart';
import '../api/batman.dart';

class BatmanShows extends StatefulWidget {
  BatmanShows({Key key}) : super(key: key);

  @override
  BatmanShowsState createState() => BatmanShowsState();
}

class BatmanShowsState extends State<BatmanShows> {
  Future<Shows> futureShows;

  @override
  void initState() {
    super.initState();
    futureShows = Shows.fetchAll();
  }

  void _onShowTap(BuildContext context, int showId, String name) {
    Navigator.pushNamed(context, 'ShowDetail',
        arguments: {'id': showId, 'name': name});
  }

  Widget _buildSuggestions(List shows) {
    return ListView.separated(
      padding: EdgeInsets.all(12),
      itemCount: shows.length,
      separatorBuilder: (BuildContext context, int i) => Divider(),
      itemBuilder: (BuildContext context, int i) =>
          _buildRow(shows[i]['id'], shows[i]['name']),
    );
  }

  Widget _buildRow(int id, String name) {
    print('buildRow$id');
    // final bool alreadySaved = _saved.contains(pair);
    return ListTile(
        title: Text(
          name,
          style: TextStyle(fontFamily: 'TradeWinds'),
        ),
        onTap: () => _onShowTap(context, id, name)
        // trailing: Icon(
        //   alreadySaved ? Icons.favorite : Icons.favorite_border,
        //   color: alreadySaved ? Colors.red : null,
        // ),
        // }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Batman TV Shows'),
      ),
      body: Center(
        child: FutureBuilder<Shows>(
          future: futureShows,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildSuggestions(snapshot.data.shows);
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
