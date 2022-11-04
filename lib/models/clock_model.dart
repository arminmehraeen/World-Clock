import 'dart:convert';

import 'package:equatable/equatable.dart';

class Clock extends Equatable {
  final String location;
  final String flag;
  final String url;
  bool? isDayTime;
  String? time;

  Clock({
    required this.location,
    this.time,
    required this.flag,
    required this.url,
    this.isDayTime,
  }) {
    isDayTime = isDayTime ?? false;
    time = time ?? "";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Clock &&
          runtimeType == other.runtimeType &&
          location == other.location &&
          time == other.time &&
          flag == other.flag &&
          url == other.url &&
          isDayTime == other.isDayTime);

  @override
  int get hashCode =>
      location.hashCode ^
      time.hashCode ^
      flag.hashCode ^
      url.hashCode ^
      isDayTime.hashCode;

  @override
  String toString() {
    return 'Clock{locations: $location, time: $time, flag: $flag, url: $url, isDayTime: $isDayTime}';
  }

  Clock copyWith({
    String? location,
    String? time,
    String? flag,
    String? url,
    bool? isDayTime,
  }) {
    return Clock(
        location: location ?? this.location,
        time: time ?? this.time,
        flag: flag ?? this.flag,
        url: url ?? this.url,
        isDayTime: isDayTime ?? this.isDayTime);
  }

  @override
  List<Object?> get props => [location, time, flag, url, isDayTime];

  Map<String, dynamic> toMap() {
    return {
      'locations': location,
      'time': time,
      'flag': flag,
      'url': url,
      'isDayTime': isDayTime,
    };
  }

  String toJson() => json.encode(toMap());

  factory Clock.fromJson(String source) => Clock.fromMap(json.decode(source)) ;

  factory Clock.fromMap(Map<String, dynamic> map) {
    return Clock(
      location: map['locations'] as String,
      time: map['time'] as String,
      flag: map['flag'] as String,
      url: map['url'] as String,
      isDayTime: map['isDayTime'] as bool,
    );
  }

  static List<Clock> locations = [
    Clock(location: 'Iran-Tehran', flag: 'iran.png', url: 'ASIA/TEHRAN'),
    Clock(location: 'Spain-Madrid', flag: 'spain.png', url: 'EUROPE/MADRID'),
    Clock(location: 'Italy-Rome', flag: 'italy.png', url: 'EUROPE/ROME'),
    Clock(
        location: 'Netherlands-Amsterdam',
        flag: 'netherlands.png',
        url: 'EUROPE/AMSTERDAM'),
    Clock(location: 'America-NewYork', flag: 'america.png', url: 'AMERICA/NEW_YORK'),
    Clock(location: 'Japan-Tokyo', flag: 'japan.png', url: 'ASIA/TOKYO'),
    Clock(location: 'German-Berlin', flag: 'german.png', url: 'EUROPE/BERLIN'),
    Clock(location: 'France-Paris', flag: 'france.png', url: 'EUROPE/PARIS'),
    Clock(location: 'English-London', flag: 'english.png', url: 'EUROPE/LONDON'),
    Clock(location: 'Greece-Athens', flag: 'greece.png', url: 'EUROPE/ATHENS'),
    Clock(location: 'Portugal-Lisbon', flag: 'portugal.png', url: 'EUROPE/LISBON'),
    Clock(location: 'Russia-Moscow', flag: 'russia.png', url: 'EUROPE/MOSCOW'),
    Clock(location: 'Qatar-Qatar', flag: 'qatar.png', url: 'ASIA/QATAR'),
    Clock(location: 'Singapore-Singapore', flag: 'singapore.png', url: 'ASIA/SINGAPORE'),
    Clock(location: 'Afghanistan-Kabul', flag: 'afghanistan.png', url: 'ASIA/KABUL'),
    Clock(location: 'China-Hong Kong', flag: 'china.png', url: 'ASIA/HONG_KONG'),
    Clock(location: 'Ukraine-Kiev', flag: 'ukraine.png', url: 'EUROPE/KIEV'),
    Clock(
        location: 'United Arab Emirates-Dubai', flag: 'united-arab-emirates.png', url: 'ASIA/DUBAI'),
    Clock(location: 'Panama-Panama', flag: 'panama.png', url: 'AMERICA/PANAMA'),
    Clock(
        location: 'Argentina-Buenos Aires',
        flag: 'argentina.png',
        url: 'AMERICA/ARGENTINA/BUENOS_AIRES'),
    Clock(
        location: 'Costa Rica-Costa Rica',
        flag: 'costa-rica.png',
        url: 'AMERICA/COSTA_RICA'),
    Clock(location: 'Lebanon-Beirut', flag: 'lebanon.png', url: 'ASIA/BEIRUT'),
    Clock(location: 'Peru-Lima', flag: 'peru.png', url: 'AMERICA/LIMA'),
  ];
}
