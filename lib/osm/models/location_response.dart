// To parse this JSON data, do
//
//     final locationResponse = locationResponseFromJson(jsonString);

import 'dart:convert';

class LocationResponse {
  final int placeId;
  final String licence;
  final int osmId;
  final String lat;
  final String lon;
  final String displayName;
  final Address address;

  LocationResponse({
    required this.placeId,
    required this.licence,
    required this.osmId,
    required this.lat,
    required this.lon,
    required this.displayName,
    required this.address,
  });

  double get latitude => double.parse(lat);
  double get longitude => double.parse(lon);

  factory LocationResponse.fromRawJson(String str) =>
      LocationResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      LocationResponse(
        placeId: json["place_id"],
        licence: json["licence"],
        osmId: json["osm_id"],
        lat: json["lat"],
        lon: json["lon"],
        displayName: json["display_name"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "licence": licence,
        "osm_id": osmId,
        "lat": lat,
        "lon": lon,
        "display_name": displayName,
        "address": address.toJson(),
      };
}

class Address {
  final String? village;
  final String? county;
  final String? iso31662Lvl6;
  final String? state;
  final String? iso31662Lvl4;
  final String? country;
  final String? countryCode;

  Address({
    required this.village,
    required this.county,
    required this.iso31662Lvl6,
    required this.state,
    required this.iso31662Lvl4,
    required this.country,
    required this.countryCode,
  });

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        village: json["village"],
        county: json["county"],
        iso31662Lvl6: json["ISO3166-2-lvl6"],
        state: json["state"],
        iso31662Lvl4: json["ISO3166-2-lvl4"],
        country: json["country"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "village": village,
        "county": county,
        "ISO3166-2-lvl6": iso31662Lvl6,
        "state": state,
        "ISO3166-2-lvl4": iso31662Lvl4,
        "country": country,
        "country_code": countryCode,
      };
}
