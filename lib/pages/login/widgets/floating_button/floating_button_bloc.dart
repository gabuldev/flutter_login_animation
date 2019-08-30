import 'package:rxdart/rxdart.dart';


class BlocFloatingButton {

//! STREAMS
  var selected = BehaviorSubject<bool>.seeded(false);
  bool get selectedValue => selected.value;
  Sink<bool> get selectedIn => selected.sink; 


  void dispose(){
    selected.close();
  }
}