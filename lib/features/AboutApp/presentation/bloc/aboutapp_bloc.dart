import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'aboutapp_event.dart';
part 'aboutapp_state.dart';
class AboutappBloc extends Bloc<AboutappEvent, AboutappState> {
  AboutappBloc() : super(AboutappInitial());
  @override
  Stream<AboutappState> mapEventToState(
    AboutappEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
