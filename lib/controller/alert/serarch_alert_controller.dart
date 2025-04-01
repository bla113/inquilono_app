import 'package:http/http.dart' as http;
import 'dart:convert';

searchAlertApiApp(String token, String value) async {
 // const String baseUrl = 'http://10.0.2.2:8000/api/search/alerta'; //localhost
  const String baseUrl = 'https://secure-app-condomino-cr.laravel.cloud/api/alerta/search/'; //localhost
  //const String api = 'login';

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'cache-control': 'no-cache',
    'Authorization': 'Bearer $token',
  };

var body= jsonEncode({
  'alerta':value
});  ///debugPrint(token);
  var url = Uri.parse(baseUrl);
  // var body = json.encode({'titulo': titulo, 'descripcion': descripcion});
 

  var response = await http.Client().post(url, headers: headers,body: body);

  if (response.statusCode == 200) {
    var mesaje = jsonDecode(response.body);

    if (mesaje['code'] == 201) {
       
       //debugPrint(mesaje['alertas']);

      return mesaje['alertas'];
    }
  } else {
    // Si la respuesta no es OK, lanza una excepción.
    return 400;
  }

  // Si el servidor devuelve una respuesta OK, parsea el JSON
}
