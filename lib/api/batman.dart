import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Show {
  final int id;
  final String name;
  final String image;
  final String summary;

  Show({this.id, this.name, this.image, this.summary});

  factory Show.fromJson(show) {
    return Show(
      id: show['id'],
      name: show['name'],
      image: show['image']['medium'],
      summary: show['summary'],
    );
  }

  static Future<Show> fetchById(int showId) async {
    final response = await http.get('https://api.tvmaze.com/shows/$showId');
    print('showId>>>>>$showId');
    if (response.statusCode == 200) {
      var krishna = jsonDecode(response.body);

      print('krihna>>>');
      print(krishna);
      // If the server did return a 200 OK response, then parse the JSON.
      return Show.fromJson(krishna);
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Shows');
    }
  }
}

class Shows {
  // final int userId;
  // final int id;
  // final String title;
  // final double score;

  // Shows({this.userId, this.id, this.title});
  // final List<Show> shows;
  final List<Map<String, dynamic>> shows;

  Shows(this.shows);

  factory Shows.fromJson(List json) {
    // return Shows(json.map((show) {
    //   return Show.fromJson(show);
    // }).toList());

    return Shows(json.map((show) {
      return {
        'id': show['show']['id'],
        'name': show['show']['name'],
      };
    }).toList());

    // return Shows(shows);

    // return Shows(shows);
    // return Shows(

    // userId: json['userId'],
    // id: json['id'],
    // title: json['title'],
    // );
  }

  static Future<Shows> fetchAll() async {
    final response =
        await http.get('https://api.tvmaze.com/search/shows?q=batman');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      return Shows.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Shows');
    }
  }
}
