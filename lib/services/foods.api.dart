import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodService {
  Future<List<dynamic>> fetchFoods() async {
    final response = await http.get(Uri.parse('http://localhost:5000/api/foods/'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception('Error al cargar los alimentos: ${response.statusCode}');
    }
  }
}
