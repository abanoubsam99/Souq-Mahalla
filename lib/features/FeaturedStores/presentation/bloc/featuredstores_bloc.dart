import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'featuredstores_event.dart';
part 'featuredstores_state.dart';
class FeaturedstoresBloc extends Bloc<FeaturedstoresEvent, FeaturedstoresState> {
  FeaturedstoresBloc() : super(FeaturedstoresInitial());
  @override
  Stream<FeaturedstoresState> mapEventToState(
    FeaturedstoresEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
