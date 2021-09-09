part of 'communicate_bloc.dart';
abstract class CommunicateState extends Equatable {
  const CommunicateState();
}
class CommunicateInitial extends CommunicateState {
  @override
  List<Object> get props => [];
}
