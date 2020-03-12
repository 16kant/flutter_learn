import 'package:flutter/material.dart';
import '../api/batman.dart';
import 'dart:ui';

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
          // constraints: BoxConstraints.expand(
          //   height: 240.0,
          // ),
          decoration: BoxDecoration(
            // border: Border.all(
            //     // width: 10,
            //     // color: Colors.black38,
            //     ),
            // borderRadius: BorderRadius.all(
            //   Radius.circular(50),
            // ),
            // shape: BoxShape.circle,
            color: Colors.black,
            // gradient: LinearGradient(
            //   colors: [
            //     Colors.black,
            //     Colors.grey,
            //     // Colors.purple,
            //     // Colors.yellow,
            //     // Colors.red,
            //   ],
            //   // tileMode: TileMode.clamp,
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
            // image: DecorationImage(
            //   fit: BoxFit.contain,
            //   image: NetworkImage(
            //     data.image,
            //   ),
            // ),
          ),
          child: Image.network(
            data.image,
            // fit: BoxFit.contain,
          ),
          // width: 240,
          height: 220,
          // alignment: Alignment(1.0, 1.0),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.grey,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Text(
            data.name,
            style: TextStyle(
              fontFamily: 'TradeWinds',
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          padding: EdgeInsets.fromLTRB(16, 24, 16, 10),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Text(
                data.summary
                    .replaceAllMapped(RegExp(r'<[^>]*>'), (match) => ""),
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
    print(MediaQuery.of(context).size);
    print(window.physicalSize);
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
