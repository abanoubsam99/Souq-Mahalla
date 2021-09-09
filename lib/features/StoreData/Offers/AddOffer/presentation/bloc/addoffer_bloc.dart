import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'addoffer_event.dart';
part 'addoffer_state.dart';
class AddofferBloc extends Bloc<AddofferEvent, AddofferState> {
  AddofferBloc() : super(AddofferInitial());
  @override
  Stream<AddofferState> mapEventToState(
    AddofferEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
