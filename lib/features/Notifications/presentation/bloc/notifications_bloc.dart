import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsInitial());
  @override
  Stream<NotificationsState> mapEventToState(
    NotificationsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
