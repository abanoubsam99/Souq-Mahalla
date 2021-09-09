import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'storelogo_event.dart';
part 'storelogo_state.dart';
class StorelogoBloc extends Bloc<StorelogoEvent, StorelogoState> {
  StorelogoBloc() : super(StorelogoInitial());
  @override
  Stream<StorelogoState> mapEventToState(
    StorelogoEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
