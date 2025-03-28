import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

createPanicAlert(String token) async {
  const String baseUrl = 'http://10.0.2.2:8000/api/alerta/panico'; //localhost
  //const String baseUrl = 'http://127.0.0.1:8000/api/alerta'; //localhost
  //const String api = 'login';

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'cache-control': 'no-cache',
    'Authorization': 'Bearer $token',
  };
  debugPrint(token);
  var url = Uri.parse(baseUrl);
  // var body = json.encode({'titulo': titulo, 'descripcion': descripcion});

  var response = await http.Client().post(url, headers: headers);
  debugPrint(response.body);

  if (response.statusCode == 200) {
    var mesaje = jsonDecode(response.body);
    if (mesaje['code'] == 201) {
      return 200;
    }
  } else {
    // Si la respuesta no es OK, lanza una excepción.
    return 400;
  }

  // Si el servidor devuelve una respuesta OK, parsea el JSON
}
