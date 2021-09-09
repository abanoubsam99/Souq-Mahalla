import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'paying_event.dart';
part 'paying_state.dart';
class PayingBloc extends Bloc<PayingEvent, PayingState> {
  PayingBloc() : super(PayingInitial());
  @override
  Stream<PayingState> mapEventToState(
    PayingEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
