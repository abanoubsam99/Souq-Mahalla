import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'addnewaddress_event.dart';
part 'addnewaddress_state.dart';
class AddnewaddressBloc extends Bloc<AddnewaddressEvent, AddnewaddressState> {
  AddnewaddressBloc() : super(AddnewaddressInitial());
  @override
  Stream<AddnewaddressState> mapEventToState(
    AddnewaddressEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
