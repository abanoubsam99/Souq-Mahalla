import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'editeproduct_event.dart';
part 'editeproduct_state.dart';
class EditeproductBloc extends Bloc<EditeproductEvent, EditeproductState> {
  EditeproductBloc() : super(EditeproductInitial());
  @override
  Stream<EditeproductState> mapEventToState(
    EditeproductEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
