import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future login(String email, String password) async {
  //const String baseUrl = 'http://seguridad.danilos27.sg-host.com/api/login'; //localhost
  const String baseUrl = 'http://10.0.2.2:8000/api/login'; //localhost

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'cache-control': 'no-cache',
  };

  var url = Uri.parse(baseUrl);
  var body = json.encode({'email': email, 'password': password});

  var response = await http.Client().post(url, headers: headers, body: body);

  //debugPrint(response.body);
  try {
    if (response.statusCode == 200) {
      var mesaje = jsonDecode(response.body);

      if (mesaje['code'] == 200) {
        saveSharedPreferences(mesaje['token']);

        saveUserAuthSecureStorage(
          mesaje['user']['name'],
          mesaje['user']['email'],
        );
        return 200;
      }
    } else {
      // Si la respuesta no es OK, lanza una excepción.
    }
  } catch (e) {
    debugPrint('Failed  $e');
  }
}

Future saveSharedPreferences(String accessToken) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('accessToken', accessToken);
}

Future getSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final String? accessToken = prefs.getString('accessToken');
  return accessToken;
}

Future saveUserAuthSecureStorage(String userNameApp, String emaildApp) async {
  final username = FlutterSecureStorage();
  final email = FlutterSecureStorage();

  await username.write(key: 'username', value: userNameApp);
  await email.write(key: 'email', value: emaildApp);
}

Future getUserNameAuthSecureStorage() async {
  final username = FlutterSecureStorage();

  String? usernameApp = await username.read(key: 'username');

  return usernameApp;
}

Future getUserPasswordAuthSecureStorage() async {
  final email = FlutterSecureStorage();

  String? useremail = await email.read(key: 'email');

  return useremail;
}
