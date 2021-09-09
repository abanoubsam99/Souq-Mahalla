import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'allorders_event.dart';
part 'allorders_state.dart';
class AllordersBloc extends Bloc<AllordersEvent, AllordersState> {
  AllordersBloc() : super(AllordersInitial());
  @override
  Stream<AllordersState> mapEventToState(
    AllordersEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
