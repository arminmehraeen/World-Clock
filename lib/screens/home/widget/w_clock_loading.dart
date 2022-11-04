import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ClockLoadingWidget extends StatelessWidget {
  const ClockLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitThreeBounce(
          color: Color(0xFFA20606),
          size: 15.0,
        ));
  }
}
