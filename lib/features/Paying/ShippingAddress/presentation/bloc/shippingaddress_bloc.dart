import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'shippingaddress_event.dart';
part 'shippingaddress_state.dart';
class ShippingaddressBloc extends Bloc<ShippingaddressEvent, ShippingaddressState> {
  ShippingaddressBloc() : super(ShippingaddressInitial());
  @override
  Stream<ShippingaddressState> mapEventToState(
    ShippingaddressEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
