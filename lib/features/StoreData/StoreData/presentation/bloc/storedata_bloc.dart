import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'storedata_event.dart';
part 'storedata_state.dart';
class StoredataBloc extends Bloc<StoredataEvent, StoredataState> {
  StoredataBloc() : super(StoredataInitial());
  @override
  Stream<StoredataState> mapEventToState(
    StoredataEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
