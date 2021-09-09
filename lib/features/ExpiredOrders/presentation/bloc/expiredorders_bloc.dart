import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'expiredorders_event.dart';
part 'expiredorders_state.dart';
class ExpiredordersBloc extends Bloc<ExpiredordersEvent, ExpiredordersState> {
  ExpiredordersBloc() : super(ExpiredordersInitial());
  @override
  Stream<ExpiredordersState> mapEventToState(
    ExpiredordersEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
