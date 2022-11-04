import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_clock/blocs/clock/clock_bloc.dart';
import 'package:world_clock/models/clock_model.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({Key? key, required this.clock}) : super(key: key);
  final Clock clock;

  @override
  Widget build(BuildContext context) {
    List<Clock> locations = setList();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: Color(0xFFA20606),
        ),
        title: const Text("Select Location"),
      ),
      body: BlocListener<ClockBloc, ClockState>(
        listener: (context, state) {
          if (state is ClockLoading) {
            Navigator.pop(context);
          }
        },
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) => _locationCard(locations[index], () {
            context.read<ClockBloc>().add(ChangeClock(clock: locations[index]));
          }),
        ),
      ),
    );
  }

  Widget _locationCard(Clock clock, Function onTap) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      elevation: 5,
      child: ListTile(
        onTap: () => onTap(),
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              radius: 48, // Image radius
              backgroundImage: AssetImage(
                "assets/country/${clock.flag}",
              ),
            ),
          ),
        ),
        trailing: this.clock.location == clock.location
            ? const Card(
                shape: CircleBorder(),
                color: Color(0xFFA20606) ,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              )
            : null,
        subtitle: Text(clock.location.split("-")[1].toLowerCase() , overflow: TextOverflow.ellipsis,
          maxLines: 1, style: const TextStyle(color: Colors.white70)),
        title: Text(
          clock.location.split("-")[0],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  List<Clock> setList() {
    List<Clock> list = [clock];
    var temp = Clock.locations.where((e) => e.location != clock.location).toList();
    list.addAll(temp);
    return list;
  }
}
