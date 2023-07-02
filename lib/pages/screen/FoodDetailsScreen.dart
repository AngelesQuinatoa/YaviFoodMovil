import 'package:flutter/material.dart';
import '../../models/food_model.dart';
import '../components/navbar.dart';
import 'cart.screen.dart';

class FoodDetailsScreen extends StatelessWidget {
  final Food food;

  const FoodDetailsScreen({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    food.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'images/food-1.jpg',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                food.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    food.favorite ? Icons.favorite : Icons.favorite_border,
                    color: food.favorite ? Colors.red : Colors.black,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Valoración: ${food.stars}/5',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Origen: ${food.origins.join(", ")}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: food.tags
                    .map(
                      (tag) => Chip(
                        label: Text(tag),
                        backgroundColor: Colors.blue,
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 8),
              Text(
                'Cocción: ${food.cookTime} minutos',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Precio: \$${food.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  CartScreen.addToCart(
                    CartItem(
                      food: food,
                      quantity: 1, // Puedes ajustar la cantidad según tus necesidades
                      totalPrice: food.price.toDouble(), // Precio total para un solo producto
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Producto añadido al carrito'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text('Añadir al carrito'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
