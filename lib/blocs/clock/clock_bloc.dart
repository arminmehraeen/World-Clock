import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_clock/models/clock_model.dart';
import 'package:world_clock/service/s_api.dart';
import 'package:world_clock/service/s_storage.dart';

part 'clock_event.dart';
part 'clock_state.dart';

class ClockBloc extends Bloc<ClockEvent, ClockState> {

  var api = ApiService() ;
  var storage = StorageService() ;

  ClockBloc() : super(ClockLoading()) {
    on<LoadClock>(_onLoadClock);
    on<ChangeClock>(_onChangeClock);
  }

  void _onLoadClock(LoadClock event , Emitter emit) async {
    Clock clock  = await storage.read() ;
    ClockState result = await api.getData(clock: clock) ;
    emit(result);
  }

  void _onChangeClock(ChangeClock event , Emitter emit) async {
    await storage.write(event.clock) ;
    emit(ClockLoading());
    ClockState result = await api.getData(clock: event.clock) ;
    emit(result);
  }
}
