import 'package:flutter/material.dart';
import '../api/batman.dart';

class ShowDetail extends StatelessWidget {
  final int showId;
  final String name;

  ShowDetail(this.showId, this.name);

  Widget _detailsWidget(Show data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          constraints: BoxConstraints.expand(
            height: 240.0,
          ),
          child: Image.network(
            data.image,
            fit: BoxFit.contain,
          ),
          color: Colors.black,
        ),
        Container(
          child: Text(
            data.name,
            style: TextStyle(
              fontFamily: 'TradeWinds',
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          padding: EdgeInsets.fromLTRB(16, 16, 16, 10),
        ),
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Text(
                data.summary.replaceAll('<p>', '').replaceAll('</p>', ' '),
              ),
            ),
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: Show.fetchById(showId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _detailsWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
