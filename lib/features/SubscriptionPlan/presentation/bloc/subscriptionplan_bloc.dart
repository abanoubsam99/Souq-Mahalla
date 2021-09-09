import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'subscriptionplan_event.dart';
part 'subscriptionplan_state.dart';
class SubscriptionplanBloc extends Bloc<SubscriptionplanEvent, SubscriptionplanState> {
  SubscriptionplanBloc() : super(SubscriptionplanInitial());
  @override
  Stream<SubscriptionplanState> mapEventToState(
    SubscriptionplanEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
