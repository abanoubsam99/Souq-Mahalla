import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'technicalsupport_event.dart';
part 'technicalsupport_state.dart';
class TechnicalsupportBloc extends Bloc<TechnicalsupportEvent, TechnicalsupportState> {
  TechnicalsupportBloc() : super(TechnicalsupportInitial());
  @override
  Stream<TechnicalsupportState> mapEventToState(
    TechnicalsupportEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
