part of 'clock_bloc.dart';

@immutable
abstract class ClockEvent {}

class LoadClock extends ClockEvent {
  LoadClock() ;
}

class ChangeClock extends ClockEvent {
  final Clock clock ;
  ChangeClock({required this.clock}) ;
}
