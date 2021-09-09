import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'myproducts_event.dart';
part 'myproducts_state.dart';
class MyproductsBloc extends Bloc<MyproductsEvent, MyproductsState> {
  MyproductsBloc() : super(MyproductsInitial());
  @override
  Stream<MyproductsState> mapEventToState(
    MyproductsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
