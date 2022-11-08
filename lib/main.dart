import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_clock/blocs/clock/clock_bloc.dart';
import 'package:world_clock/screens/p_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClockBloc()..add(LoadClock()) ,
      child: MaterialApp(
        title: 'World Clock',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "yekan",
            primarySwatch: Colors.blue,
            primaryColor: const Color(0xFF142550),
            appBarTheme: const AppBarTheme(
              color: Color(0xFF142550) ,
            )
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
