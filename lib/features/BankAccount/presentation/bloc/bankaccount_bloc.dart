import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'bankaccount_event.dart';
part 'bankaccount_state.dart';
class BankaccountBloc extends Bloc<BankaccountEvent, BankaccountState> {
  BankaccountBloc() : super(BankaccountInitial());
  @override
  Stream<BankaccountState> mapEventToState(
    BankaccountEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
