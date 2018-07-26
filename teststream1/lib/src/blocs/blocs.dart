import 'package:rxdart/rxdart.dart';

import '../models/movie.dart';



class CartBloc {
 API api = API();
 String queryString = 'world';

 BehaviorSubject<String> _searchStringController = BehaviorSubject<String>();

 Observable<String> get searchStringControllerStream => _searchStringController.stream;

 Function(String) get searchStringControllerSink => _searchStringController.sink.add;




 startSearch(String newString){

   searchStringControllerSink(newString);

   searchStringControllerStream.asyncMap((api.get)).asBroadcastStream();



 }


  dispose(){
    _searchStringController.close();

  }


}


