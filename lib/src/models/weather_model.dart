import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  WeatherModel({
    this.location,
    this.current,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Location? location;
  Current? current;
}

@JsonSerializable()
class Current {
  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });
  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  @JsonKey(name: 'last_updated_epoch')
  int? lastUpdatedEpoch;
  @JsonKey(name: 'last_updated')
  String? lastUpdated;
  @JsonKey(name: 'temp_c')
  double? tempC;
  @JsonKey(name: 'temp_f')
  double? tempF;
  @JsonKey(name: 'is_day')
  int? isDay;
  Condition? condition;
  @JsonKey(name: 'wind_mph')
  double? windMph;
  @JsonKey(name: 'wind_kph')
  double? windKph;
  @JsonKey(name: 'wind_degree')
  double? windDegree;
  @JsonKey(name: 'wind_dir')
  String? windDir;
  @JsonKey(name: 'pressure_mb')
  double? pressureMb;
  @JsonKey(name: 'pressure_in')
  double? pressureIn;
  @JsonKey(name: 'precip_mm')
  double? precipMm;
  @JsonKey(name: 'precip_in')
  double? precipIn;
  double? humidity;
  double? cloud;
  @JsonKey(name: 'feelslike_c')
  double? feelslikeC;
  @JsonKey(name: 'feelslike_f')
  double? feelslikeF;
  @JsonKey(name: 'vis_km')
  double? visKm;
  @JsonKey(name: 'vis_miles')
  double? visMiles;
  double? uv;
  @JsonKey(name: 'gust_mph')
  double? gustMph;
  @JsonKey(name: 'gust_kph')
  double? gustKph;
}

@JsonSerializable()
class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,
  });
  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  String? text;
  String? icon;
  int? code;
}

@JsonSerializable()
class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  @JsonKey(name: 'tz_id')
  String? tzId;
  @JsonKey(name: 'local_time_epoch')
  int? localtimeEpoch;
  String? localtime;
}
