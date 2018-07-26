
import 'dart:async';

void main(){

  final controller = new StreamController();
  final order = new Order('orange');

  controller.sink.add(order);

  controller.stream
          .map((oldie){
            return oldie.type;
  }).transform(baker).listen((cake)=> print('here is ur $cake'), onError: (err)=> print(err));

}
final baker = new StreamTransformer.fromHandlers(
  handleData: (cakeType, sink){
    if(cakeType == 'chocolate'){
      sink.add(new Cake());
    } else {
      sink.addError('I cant bake a ${cakeType} cake');
    }

  }


);

class Cake {}

class Order {
  String type;

  Order(this.type);
}