//import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future getProfileApp(String? token) async {
  const String baseUrl = 'http://seguridad.danilos27.sg-host.com/api/profile/user';

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'cache-control': 'no-cache',
    'Authorization': 'Bearer $token',
  };

  var url = Uri.parse(baseUrl);

  var response = await http.Client().post(url, headers: headers);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    if (data['code'] == 201) {
      //debugPrint(data.toString());
      return data;
    }
  }
}
