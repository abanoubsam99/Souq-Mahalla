import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'editecommunicate_event.dart';
part 'editecommunicate_state.dart';
class EditecommunicateBloc extends Bloc<EditecommunicateEvent, EditecommunicateState> {
  EditecommunicateBloc() : super(EditecommunicateInitial());
  @override
  Stream<EditecommunicateState> mapEventToState(
    EditecommunicateEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
