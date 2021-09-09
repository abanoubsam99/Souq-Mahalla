import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'appevaluation_event.dart';
part 'appevaluation_state.dart';
class AppevaluationBloc extends Bloc<AppevaluationEvent, AppevaluationState> {
  AppevaluationBloc() : super(AppevaluationInitial());
  @override
  Stream<AppevaluationState> mapEventToState(
    AppevaluationEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
