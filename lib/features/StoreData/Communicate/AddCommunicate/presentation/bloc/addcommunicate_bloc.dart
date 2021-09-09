import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'addcommunicate_event.dart';
part 'addcommunicate_state.dart';
class AddcommunicateBloc extends Bloc<AddcommunicateEvent, AddcommunicateState> {
  AddcommunicateBloc() : super(AddcommunicateInitial());
  @override
  Stream<AddcommunicateState> mapEventToState(
    AddcommunicateEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
