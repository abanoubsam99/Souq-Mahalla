import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'clintprofile_event.dart';
part 'clintprofile_state.dart';
class ClintprofileBloc extends Bloc<ClintprofileEvent, ClintprofileState> {
  ClintprofileBloc() : super(ClintprofileInitial());
  @override
  Stream<ClintprofileState> mapEventToState(
    ClintprofileEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
