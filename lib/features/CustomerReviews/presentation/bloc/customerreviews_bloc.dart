import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'customerreviews_event.dart';
part 'customerreviews_state.dart';
class CustomerreviewsBloc extends Bloc<CustomerreviewsEvent, CustomerreviewsState> {
  CustomerreviewsBloc() : super(CustomerreviewsInitial());
  @override
  Stream<CustomerreviewsState> mapEventToState(
    CustomerreviewsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
