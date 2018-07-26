import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'dart:async';
import '../models/item_model.dart';
import 'repository.dart';

final root = 'https://hacker-news.firebaseio.com/v0';



class NewsApiProvider implements Source {

  Client client = new Client();



  Future<List<int>> fetchTopIds() async {
    final response = await client.get('${root}/topstories.json');
    final ids = json.decode(response.body);

    return ids.cast<int>();


  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get('$root/item/${id}.json');
    final parsedjson = json.decode(response.body);

    

    return ItemModel.fromjson(parsedjson);

  }
}