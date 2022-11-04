import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:world_clock/blocs/clock/clock_bloc.dart';
import 'package:world_clock/screens/locations/p_locations.dart';

class ClockLoadedWidget extends StatelessWidget {
  const ClockLoadedWidget({Key? key, required this.state}) : super(key: key);
  final ClockLoaded state ;
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(state.clock.time!);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            state.clock.location.split("-")[0],
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            state.clock.location.split("-")[1],
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: _showClock(dateTime, context),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationsScreen(
                        clock: state.clock,
                      ),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1 ,
                    color: Colors.white70
                  ) ,
                  shape: BoxShape.circle ,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    radius: 48, // Image radius
                    backgroundImage: AssetImage(
                      "assets/country/${state.clock.flag}",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showClock(DateTime dateTime, context) {
    return AnalogClock(
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: const Color(0xFFA20606)),
          color: Colors.transparent,
          shape: BoxShape.circle),
      isLive: true,
      secondHandColor: const Color(0xFFA20606),
      hourHandColor: Colors.white,
      minuteHandColor: Colors.white,
      showSecondHand: true,
      showNumbers: false,
      digitalClockColor: Colors.white70,
      showAllNumbers: true,
      textScaleFactor: 1.4,
      showTicks: true,
      showDigitalClock: true,
      datetime: dateTime,
    );
  }
}
