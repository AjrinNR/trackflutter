import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_application_1/modelapi/globmodel.dart';

class Global {
  final String url = "https://api.kawalcorona.com/";
  Future<List<CovidGlob>> getDataGlobal() async {
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<CovidGlob> dataGlob =
          body.map((dynamic item) => CovidGlob.fromJson(item)).toList();
      return dataGlob;
    } else {
      throw "tidak bisa mendapat data";
    }
  }
}
