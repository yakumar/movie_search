import 'dart:async';


void main(){

  final controller = new StreamController();

  final order = new Order('banana');

  final baker = new StreamTransformer.fromHandlers(handleData: (cakeType, input){
    if(cakeType == 'chocolate'){
      input.add(new Cake());
    } else {
      input.addError('I cant bake ${cakeType} type');
    }

  });

  controller.sink.add(order);


  controller.stream
      .map((mappedStream){
        //print(mappedStream.type);
        return mappedStream.type;

  })
      .transform(baker)
      .listen((cake)=> print('heres ur cake $cake'),
              onError: (err) => print(err),
    onDone: () => print('All done ')

  );



}


class Cake {}

class Order {
  String type;

  Order(this.type);
}