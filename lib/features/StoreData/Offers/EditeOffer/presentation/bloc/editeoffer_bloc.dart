import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'editeoffer_event.dart';
part 'editeoffer_state.dart';
class EditeofferBloc extends Bloc<EditeofferEvent, EditeofferState> {
  EditeofferBloc() : super(EditeofferInitial());
  @override
  Stream<EditeofferState> mapEventToState(
    EditeofferEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
