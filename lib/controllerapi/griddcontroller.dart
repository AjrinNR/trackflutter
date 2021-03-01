import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_application_1/modelapi/griddmodel.dart';

class GetPost {
  final String getposturl = "https://api.kawalcorona.com/indonesia";

  //mengambil data
  Future<List<Post>> manggilPostData() async {
    Response res = await get(getposturl);
    //mengubah json ke string
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      //data ditampung ke dalam list dimodel post dan dirubah ke format json
      List<Post> postData =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return postData;
    } else {
      throw "Data tidak ada";
    }
  }
}
