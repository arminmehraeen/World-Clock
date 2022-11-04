import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_clock/blocs/clock/clock_bloc.dart';
import 'package:world_clock/screens/home/widget/w_clock_error.dart';
import 'package:world_clock/screens/home/widget/w_clock_loaded.dart';
import 'package:world_clock/screens/home/widget/w_clock_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<ClockBloc, ClockState>(
          builder: (context, state) => _stateBuilder(state)
        ),
      ),
    );
  }

  Widget _stateBuilder (ClockState state) {
    if (state is ClockLoading) return const ClockLoadingWidget() ;
    if (state is ClockLoaded) return ClockLoadedWidget(state: state) ;
    if (state is ClockError) return const ClockErrorWidget(message: "Problem receiving information from the server") ;
    if (state is ClockInternetError) return const ClockErrorWidget(message: "The problem of not accessing the Internet (check the network connections)") ;
    return const ClockErrorWidget(message: "There is a problem with the program") ;
  }

}
