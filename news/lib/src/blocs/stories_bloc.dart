
import 'package:rxdart/rxdart.dart';
import 'dart:async';

import '../models/item_model.dart';
import '../resources/repository.dart';


class StoriesBloc {

  Repository repo = new Repository();

  //StreamController = Subjects;

 final _topIds = PublishSubject<List<int>>();

 //Observable = Streams;

Observable<List<int>> get topIds => _topIds.stream;

fetchTopIds()async{
  var ids = await repo.fetchTopIds();

  _topIds.sink.add(ids);
}



dispose(){
  _topIds.close();
}






}