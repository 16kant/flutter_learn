import 'dart:async';

import 'package:flutter/material.dart';
import '../api/batman.dart';
// import 'package:uni_links/uni_links.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class BatmanShows extends StatefulWidget {
  BatmanShows({Key key}) : super(key: key);

  @override
  BatmanShowsState createState() => BatmanShowsState();
}

class BatmanShowsState extends State<BatmanShows> {
  Future<Shows> futureShows;
  // StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    futureShows = Shows.fetchAll();
    // this.initDynamicLinks();
    // this.initUniLinks();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _sub.cancel();
  //   //this method not called when user press android back button or quit
  //   print('dispose');
  // }

  // *******************Unilinks**********************

  // Future<Null> initUniLinks() async {
  //   // ... check initialUri
  //   try {
  //     Uri initialUri = await getInitialUri();
  //     Navigator.pushNamed(context, '/RandomWords');

  //     // Use the uri and warn the user, if it is not correct,
  //     // but keep in mind it could be `null`.
  //   } on FormatException {
  //     // Handle exception by warning the user their action did not succeed
  //     // return?
  //   }
  //   // Attach a listener to the stream
  //   _sub = getUriLinksStream().listen((Uri uri) {
  //     Navigator.pushNamed(context, '/RandomWords');
  //     // Use the uri and warn the user, if it is not correct
  //   }, onError: (err) {
  //     // Handle exception by warning the user their action did not succeed
  //   });

  //   // NOTE: Don't forget to call _sub.cancel() in dispose()
  // }

  // ***************FirebaseDynamicLinks*****************

  // void initDynamicLinks() async {
  //   final PendingDynamicLinkData data =
  //       await FirebaseDynamicLinks.instance.getInitialLink();
  //   final Uri deepLink = data?.link;

  //   if (deepLink != null) {
  //     Navigator.pushNamed(context, deepLink.path);
  //   }

  //   FirebaseDynamicLinks.instance.onLink(
  //       onSuccess: (PendingDynamicLinkData dynamicLink) async {
  //     Timer(Duration(milliseconds: 1000), () {
  //     });
  //     final Uri deepLink = dynamicLink?.link;

  //     if (deepLink != null) {
  //       Navigator.pushNamed(context, deepLink.path);
  //     }
  //   }, onError: (OnLinkErrorException e) async {
  //     print('onLinkError');
  //     print(e.message);
  //   });
  // }

  void _onShowTap(BuildContext context, int showId, String name) {
    Navigator.pushNamed(context, '/ShowDetail',
        arguments: {'id': showId, 'name': name});
  }

  Widget _buildSuggestions(List shows) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple,
            Colors.yellow,
          ],
          tileMode: TileMode.repeated,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView.separated(
        padding: EdgeInsets.all(12),
        itemCount: shows.length,
        separatorBuilder: (BuildContext context, int i) => Divider(),
        itemBuilder: (BuildContext context, int i) =>
            _buildRow(shows[i]['id'], shows[i]['name']),
      ),
    );
  }

  Widget _buildRow(int id, String name) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(
          fontFamily: 'TradeWinds',
        ),
      ),
      onTap: () => _onShowTap(context, id, name),
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
