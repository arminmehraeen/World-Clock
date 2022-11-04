import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_clock/models/clock_model.dart';

class StorageService {

  final String _key = "todos" ;

  Future write(Clock clock) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, clock.toJson());
  }

  Future<Clock> read() async{
    final prefs = await SharedPreferences.getInstance();
    String source = prefs.getString(_key)  ?? "";
    return source.isEmpty  ? Clock.locations[0] : Clock.fromJson(source) ;
  }
}