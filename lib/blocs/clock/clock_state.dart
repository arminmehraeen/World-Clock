part of 'clock_bloc.dart';

@immutable
abstract class ClockState {}

class ClockLoading extends ClockState {}

class ClockError extends ClockState {}

class ClockInternetError extends ClockState {}

class ClockLoaded extends ClockState {
  final Clock clock ;
  ClockLoaded({required this.clock}) ;
}

