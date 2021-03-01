import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_application_1/modelapi/provmodel.dart';

class Provinsi {
  final String url = "https://api.kawalcorona.com/indonesia/provinsi";
  Future<List<CovidProvinsi>> getDataProvinsi() async {
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<CovidProvinsi> dataIndo =
          body.map((dynamic item) => CovidProvinsi.fromJson(item)).toList();
      return dataIndo;
    } else {
      throw "tidak bisa mendapat data";
    }
  }
}
