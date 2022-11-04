import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_clock/blocs/clock/clock_bloc.dart';

class ClockErrorWidget extends StatelessWidget {
  const ClockErrorWidget({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const Divider() ,
          ElevatedButton(onPressed: () {
            context.read<ClockBloc>().add(LoadClock());
          },
            style: ElevatedButton.styleFrom(
              primary: Colors.red
            ), child: const Text("Try Again"))
        ],
      ),
    );
  }
}
