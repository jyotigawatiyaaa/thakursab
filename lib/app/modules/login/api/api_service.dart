import 'package:fdis_mobile/app/endpoints.dart';
import 'package:fdis_mobile/app/modules/login/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  //GET
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);

    var response = await http.get(uri);
    return response;
  }
}
