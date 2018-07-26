import 'dart:async';



class CounterBloc {
  int _count = 0;

  // Make a couple of StreamControllers - one for taking a value and one for streambuilding

  //Business logic involves one StreamController gives the values to other in the constructor


  StreamController<int> finalStreamC = StreamController<int>.broadcast();

  get finalStreamCStream => finalStreamC.stream;

  get finalStreamSink => finalStreamC.sink.add;

  StreamController<int> consumingC = StreamController<int>();
  get consumingCSink => consumingC.sink.add;

  get consumingCStream => consumingC.stream;


  //Business logic in the constructor

  CounterBloc(){
    consumingCStream.listen((dataIncremented){
      _count += dataIncremented;
      finalStreamSink(_count);

    });
  }


  dispose(){

    finalStreamC.close();
    consumingC.close();


  }

}

var bloc = new CounterBloc();

