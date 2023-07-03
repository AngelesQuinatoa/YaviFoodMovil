import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/food_model.dart';

class FoodService {
  static const String baseUrl = 'http://localhost:5000/api';
  //static const String baseUrl = 'http://192.168.10.241:5000/api'; //internet de mi celular
  //  static const String baseUrl = 'http://192.168.100.40:5000/api'; //internet de mi casa

  Future<List<Food>> getAllFoods() async {
    final response = await http.get(Uri.parse('$baseUrl/foods'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      return data.map((json) => Food.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load foods');
    }
  }

  Future<List<Food>> getFoodsBySearchTerm(String searchTerm) async {
    final response = await http.get(Uri.parse('$baseUrl/foods/search/$searchTerm'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      return data.map((json) => Food.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load foods by search term');
    }
  }

  Future<List<Food>> getFoodsByTag(String tag) async {
    final response = await http.get(Uri.parse('$baseUrl/foods/tag/$tag'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      return data.map((json) => Food.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load foods by tag');
    }
  }

  Future<Food> getFoodById(String foodId) async {
    final response = await http.get(Uri.parse('$baseUrl/foods/$foodId'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return Food.fromJson(data);
    } else {
      throw Exception('Failed to load food by ID');
    }
  }
  
  // Implementa los demás métodos (createFood, updateFood, deleteFood) de manera similar

}
