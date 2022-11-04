import 'dart:convert';
import 'package:http/http.dart';
import 'package:world_clock/blocs/clock/clock_bloc.dart';
import 'package:world_clock/models/clock_model.dart';
import 'package:world_clock/service/s_connection.dart';

class ApiService {

  var connection = ConnectionService() ;

  final int _timeOut = 3 ;
  final _host = 'http://worldtimeapi.org/api/timezone/';

  Future<ClockState> getData({required Clock clock}) async {
    bool result = await connection.check() ;
    if (result) {
      Client client  = Client() ;
      try {
        Response response = await client.get(Uri.parse(_host + clock.url)).timeout(Duration(seconds: _timeOut),onTimeout: null);
        Map data = jsonDecode(response.body);

        String dateTime = data['datetime'];
        String offsetHour = data['utc_offset'].substring(1, 3);
        String offsetMinutes = data['utc_offset'].substring(4, 6);

        DateTime now = DateTime.parse(dateTime);
        now = now.add(Duration(hours: int.parse(offsetHour)));
        now = now.add(Duration(minutes: int.parse(offsetMinutes)));

        clock = clock.copyWith(
            isDayTime: now.hour > 6 && now.hour < 20 ? true : false,
            time: now.toString());

        // DateFormat.jm()
        //     .format(DateTime.parse(state.clock.time!)),

        return ClockLoaded(clock: clock);
      } catch (e) {
        return ClockError() ;
      }finally{
        client.close() ;
      }
    }
    return ClockInternetError() ;
  }
}
