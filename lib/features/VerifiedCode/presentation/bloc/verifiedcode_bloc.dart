import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'verifiedcode_event.dart';
part 'verifiedcode_state.dart';
class VerifiedcodeBloc extends Bloc<VerifiedcodeEvent, VerifiedcodeState> {
  VerifiedcodeBloc() : super(VerifiedcodeInitial());
  @override
  Stream<VerifiedcodeState> mapEventToState(
    VerifiedcodeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
