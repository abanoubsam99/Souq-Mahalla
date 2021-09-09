import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'sections_event.dart';
part 'sections_state.dart';
class SectionsBloc extends Bloc<SectionsEvent, SectionsState> {
  SectionsBloc() : super(SectionsInitial());
  @override
  Stream<SectionsState> mapEventToState(
    SectionsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
