import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'myservices_event.dart';
part 'myservices_state.dart';
class MyservicesBloc extends Bloc<MyservicesEvent, MyservicesState> {
  MyservicesBloc() : super(MyservicesInitial());
  @override
  Stream<MyservicesState> mapEventToState(
    MyservicesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
