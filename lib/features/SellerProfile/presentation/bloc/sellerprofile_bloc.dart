import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'sellerprofile_event.dart';
part 'sellerprofile_state.dart';
class SellerprofileBloc extends Bloc<SellerprofileEvent, SellerprofileState> {
  SellerprofileBloc() : super(SellerprofileInitial());
  @override
  Stream<SellerprofileState> mapEventToState(
    SellerprofileEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
