import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'storepictures_event.dart';
part 'storepictures_state.dart';
class StorepicturesBloc extends Bloc<StorepicturesEvent, StorepicturesState> {
  StorepicturesBloc() : super(StorepicturesInitial());
  @override
  Stream<StorepicturesState> mapEventToState(
    StorepicturesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
