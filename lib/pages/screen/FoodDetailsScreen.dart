import 'package:flutter/material.dart';
import 'package:project/pages/components/drawer.dart';
import '../../models/food_model.dart';
import '../components/navbar.dart';
import 'cart.screen.dart';

class FoodDetailsScreen extends StatelessWidget {
  final Food food;

  const FoodDetailsScreen({required this.food});
@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Yavi',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lobster',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Food',
                style: TextStyle(
                  color: Color.fromARGB(255, 232, 153, 88),
                  fontFamily: 'Lobster',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Color.fromARGB(255, 232, 153, 88),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      CartScreen.cartItems.length.toString(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 232, 153, 88),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: DrawerNav(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey[400],
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    alignment: WrapAlignment.center,
                    children: food.tags
                        .map(
                          (tag) => Chip(
                            label: Text(tag),
                            backgroundColor: Color.fromARGB(255, 232, 153, 88),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Cocción: ${food.cookTime} minutos',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Precio: \$${food.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      CartScreen.addToCart(
                        CartItem(
                          food: food,
                          quantity: 1,
                          totalPrice: food.price.toDouble(),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Producto añadido al carrito'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 232, 153, 88),
                    ),
                    child: Text('Añadir al carrito'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    ),
  );
}
}