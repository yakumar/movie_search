import 'package:flutter_test/flutter_test.dart';
import 'package:news/src/resources/newsApiProvider.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';


void main(){

  test('FetchTopIds return a list of Ids', ()async {

    final newsApi =  NewsApiProvider();
    newsApi.client = MockClient((request)async{
      return Response(json.encode([1, 2, 3, 4]), 200);

    });

    final ids = await newsApi.fetchTopIds();

    expect(ids, [1, 2, 3, 4]);

  });

  test('Fetch item return item details', ()async {

    final newsApiItem = NewsApiProvider();
    newsApiItem.client = MockClient((request)async{

      final jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);

    });

    final item = await newsApiItem.fetchItem(999);

    expect(item.id, 123);

  });

}