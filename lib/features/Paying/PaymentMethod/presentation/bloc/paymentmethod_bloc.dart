import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'paymentmethod_event.dart';
part 'paymentmethod_state.dart';
class PaymentmethodBloc extends Bloc<PaymentmethodEvent, PaymentmethodState> {
  PaymentmethodBloc() : super(PaymentmethodInitial());
  @override
  Stream<PaymentmethodState> mapEventToState(
    PaymentmethodEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
