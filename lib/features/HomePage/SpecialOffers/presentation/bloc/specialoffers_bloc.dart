import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'specialoffers_event.dart';
part 'specialoffers_state.dart';
class SpecialoffersBloc extends Bloc<SpecialoffersEvent, SpecialoffersState> {
  SpecialoffersBloc() : super(SpecialoffersInitial());
  @override
  Stream<SpecialoffersState> mapEventToState(
    SpecialoffersEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
