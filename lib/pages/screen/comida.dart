import 'package:flutter/material.dart';

import '../../services/foods.api.dart';

class Comida extends StatefulWidget {
  const Comida({Key? key}) : super(key: key);

  @override
  _ComidaState createState() => _ComidaState();
}

class _ComidaState extends State<Comida> {
  final FoodService _foodService = FoodService();
  late Future<List<dynamic>> _foodsFuture;

  @override
  void initState() {
    super.initState();
    _foodsFuture = _foodService.fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Productos'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _foodsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error al cargar los alimentos: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final foods = snapshot.data!;
            return ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return ListTile(
                  title: Text(food['name']),
                  subtitle: Text(food['description']),
                  leading: Image.network(food['imageUrl']),
                  trailing: Text('\$${food['price']}'),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No se encontraron alimentos.'),
            );
          }
        },
      ),
    );
  }
}
