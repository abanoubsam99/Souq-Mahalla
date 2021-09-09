import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'servicesprovided_event.dart';
part 'servicesprovided_state.dart';
class ServicesprovidedBloc extends Bloc<ServicesprovidedEvent, ServicesprovidedState> {
  ServicesprovidedBloc() : super(ServicesprovidedInitial());
  @override
  Stream<ServicesprovidedState> mapEventToState(
    ServicesprovidedEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
