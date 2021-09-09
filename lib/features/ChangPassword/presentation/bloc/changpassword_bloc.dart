import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'changpassword_event.dart';
part 'changpassword_state.dart';
class ChangpasswordBloc extends Bloc<ChangpasswordEvent, ChangpasswordState> {
  ChangpasswordBloc() : super(ChangpasswordInitial());
  @override
  Stream<ChangpasswordState> mapEventToState(
    ChangpasswordEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
