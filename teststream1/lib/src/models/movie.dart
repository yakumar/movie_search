
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:teststream1/constants.dart';

class MovieModel {
  final String title, posterPath, overview;

  MovieModel(this.title, this.posterPath, this.overview);

  MovieModel.fromJson(Map parsedJson)
      : title = parsedJson['title'],
        posterPath = parsedJson['poster_path'],
        overview = parsedJson['overview'];


}

class API {
  final http.Client _client = http.Client();

  static const String _url = 'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query={1}';

  Future<List<MovieModel>> get(String query)async{
    List<MovieModel> list = [];

    http.Response response = await _client.get(Uri.parse(_url.replaceFirst("{1}", query)));
    var decodedData = json.decode(response.body);
    List results  = decodedData['results'];

    results.forEach((singleMovie){
      list.add(MovieModel.fromJson(singleMovie));
    });
    return list;


  }

}

