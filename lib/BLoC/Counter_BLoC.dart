 import 'dart:async';

import 'package:bloc_pattern/BLoC_event/Counter_BLoC_event.dart';

class Counter_BLoC{

  //Need to setup some streams here
    int _counter=0;

    final _counterStateController =StreamController<int>();
  //_inCounter is private.
    StreamSink<int> get _inCounter =>_counterStateController.sink;
    Stream<int> get counter =>_counterStateController.stream;

    final _counterEventController = StreamController<Counter_BLoC_event>();
    Sink<Counter_BLoC_event> get counterEventSink=>_counterEventController.sink;

    Counter_BLoC(){
      _counterEventController .stream.listen(_updateCounter);
    }


    void _updateCounter(Counter_BLoC_event event){

      if(event is IncreamentEvent){
        _counter++;
      }else{
        _counter--;
      }
      _inCounter.add(_counter);
    }

    void dispose(){
      _counterEventController.close();
      _counterStateController.close();
    }
}

