import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'storetype_event.dart';
part 'storetype_state.dart';
class StoretypeBloc extends Bloc<StoretypeEvent, StoretypeState> {
  StoretypeBloc() : super(StoretypeInitial());
  @override
  Stream<StoretypeState> mapEventToState(
    StoretypeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
