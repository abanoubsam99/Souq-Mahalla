import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'offeredproducts_event.dart';
part 'offeredproducts_state.dart';
class OfferedproductsBloc extends Bloc<OfferedproductsEvent, OfferedproductsState> {
  OfferedproductsBloc() : super(OfferedproductsInitial());
  @override
  Stream<OfferedproductsState> mapEventToState(
    OfferedproductsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
