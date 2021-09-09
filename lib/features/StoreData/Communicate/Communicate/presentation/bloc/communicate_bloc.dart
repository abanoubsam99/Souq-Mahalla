import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'communicate_event.dart';
part 'communicate_state.dart';
class CommunicateBloc extends Bloc<CommunicateEvent, CommunicateState> {
  CommunicateBloc() : super(CommunicateInitial());
  @override
  Stream<CommunicateState> mapEventToState(
    CommunicateEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
