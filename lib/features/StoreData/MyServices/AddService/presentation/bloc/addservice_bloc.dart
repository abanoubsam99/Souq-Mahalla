import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'addservice_event.dart';
part 'addservice_state.dart';
class AddserviceBloc extends Bloc<AddserviceEvent, AddserviceState> {
  AddserviceBloc() : super(AddserviceInitial());
  @override
  Stream<AddserviceState> mapEventToState(
    AddserviceEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
