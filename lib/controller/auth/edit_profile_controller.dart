//import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

Future editProfileApp(String? token, int idUser, String passwordEdit) async {
  const String baseUrl = 'https://secure-app-condomino-cr.laravel.cloud/api/profile/update';

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'cache-control': 'no-cache',
    'Authorization': 'Bearer $token',
  };

  var body = json.encode({'id': idUser, 'password': passwordEdit});
  var url = Uri.parse(baseUrl);

  var response = await http.Client().post(url, headers: headers, body: body);
  debugPrint(response.body.toString());

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    if (data['code'] == 201) {
      debugPrint(data.toString());
      return data;
    }
  }
}
