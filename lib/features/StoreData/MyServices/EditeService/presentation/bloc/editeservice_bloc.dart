import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'editeservice_event.dart';
part 'editeservice_state.dart';
class EditeserviceBloc extends Bloc<EditeserviceEvent, EditeserviceState> {
  EditeserviceBloc() : super(EditeserviceInitial());
  @override
  Stream<EditeserviceState> mapEventToState(
    EditeserviceEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
