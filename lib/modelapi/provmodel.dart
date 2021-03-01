import 'package:flutter/foundation.dart';

class CovidProvinsi {
  final String provinsi;
  final int positif;
  final int sembuh;
  final int meninggal;

  CovidProvinsi({
    @required this.provinsi,
    @required this.positif,
    @required this.sembuh,
    @required this.meninggal,
  });

  factory CovidProvinsi.fromJson(Map<String, dynamic> json) {
    return CovidProvinsi(
      provinsi: json['attributes']['Provinsi'] as String,
      positif: json['attributes']['Kasus_Posi'] as int,
      sembuh: json['attributes']['Kasus_Semb'] as int,
      meninggal: json['attributes']['Kasus_Meni'] as int,
    );
  }
}
