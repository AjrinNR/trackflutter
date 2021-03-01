import 'package:flutter/foundation.dart';

class CovidGlob {
  final String country_region;
  final int positif;
  final int sembuh;
  final int meninggal;

  CovidGlob({
    @required this.country_region,
    @required this.positif,
    @required this.sembuh,
    @required this.meninggal,
  });

  factory CovidGlob.fromJson(Map<String, dynamic> json) {
    return CovidGlob(
      country_region: json['attributes']['Country_Region'] as String,
      positif: json['attributes']['Confirmed'] as int,
      sembuh: json['attributes']['Recovered'] as int,
      meninggal: json['attributes']['Deaths'] as int,
    );
  }
}
