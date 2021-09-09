import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'editeprofile_event.dart';
part 'editeprofile_state.dart';
class EditeprofileBloc extends Bloc<EditeprofileEvent, EditeprofileState> {
  EditeprofileBloc() : super(EditeprofileInitial());
  @override
  Stream<EditeprofileState> mapEventToState(
    EditeprofileEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
