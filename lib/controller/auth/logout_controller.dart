import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future logout(String token) async {
  const String baseUrl = 'https://secure-app-condomino-cr.laravel.cloud/api/logout'; //localhost
  //const String baseUrl = 'http://127.0.0.1:8000/api/alerta'; //localhost

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'cache-control': 'no-cache',
    'Authorization': 'Bearer $token',
  };

  var url = Uri.parse(baseUrl);

  var response = await http.Client().post(url, headers: headers);

  try {
    if (response.statusCode == 200) {
      var mesaje = jsonDecode(response.body);
      if (mesaje['code'] == 201) {
        var response = await deleteSharedPreferences();
        if (response == 200) {
          return 200;
        } else {
          return 401;
        }
      }
    } else {
      // Si la respuesta no es OK, lanza una excepción.
    }
  } catch (e) {
    debugPrint('Failed to save alerta');
  }
}

Future deleteSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('accessToken');
  return 200;
}
