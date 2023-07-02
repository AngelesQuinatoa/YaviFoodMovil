import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<bool> registerUser(
      String name, String email, String password, String confirmPassword, String address) async {
    var url = Uri.parse('http://localhost:5000/api/users/register'); // Reemplaza con la URL de tu API REST
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name, //los campos que consume del backend
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'address': address,
    });

    try {
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        // Registro exitoso
        return true;
      } else {
        // Error en el registro
        print('Error: ${response.statusCode}');
        print('Mensaje de error: ${response.body}');
        return false;
      }
    } catch (e) {
      // Ocurrió un error durante la solicitud
      print('Error: $e');
      return false;
    }
    
  }
}
