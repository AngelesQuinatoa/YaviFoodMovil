import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String?> loginUser(String email, String password) async {
    //var url = Uri.parse('http://localhost:5000/api/users/login');
    //var url = Uri.parse('http://192.168.10.241:5000/api/users/login'); //internet de mi celular 
    var url = Uri.parse('http://192.168.100.40:5000/api/users/login'); //internet de mi casa // Reemplaza con la URL de tu API REST
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'email': email, 'password': password});

    try {
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        // La solicitud fue exitosa, puedes obtener los datos de respuesta
        var responseData = jsonDecode(response.body);
        // Devolver el token de autenticación
        return responseData['token'];
      } else {
        // La solicitud falló, puedes manejar el error aquí
        print('Error: ${response.statusCode}');
        print('Mensaje de error: ${response.body}');
        return null;
      }
    } catch (e) {
      // Ocurrió un error durante la solicitud
      print('Error: $e');
      return null;
    }
  }
}
