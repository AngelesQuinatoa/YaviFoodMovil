import 'package:flutter/material.dart';
import 'package:project/pages/components/drawer.dart';
import '../../models/food_model.dart';
import '../../services/foods.api.dart';
import '../components/navbar.dart';
import 'FoodDetailsScreen.dart';
import 'cart.screen.dart';

class FoodList extends StatelessWidget {
  final FoodService foodService = FoodService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
        ),
        drawer: DrawerNav(),
        body: FutureBuilder<List<Food>>(
          future: foodService.getAllFoods(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final foods = snapshot.data!;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 200 / 280, // Relación de aspecto deseada para cada tarjeta
                ),
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  final food = foods[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsScreen(food: food),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 150, // Aumenta la altura de la imagen
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
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
                          SizedBox(height: 8),
                          Text(
                            food.name,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Origen: ${food.origins.join(", ")}',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          Wrap(
                            spacing: 4,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${food.price.toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  // Funcionalidad para añadir al carrito
                                  final cartItem = CartItem(
                                    food: food,
                                    quantity: 1,
                                    totalPrice: food.price.toDouble(),
                                  );
                                  CartScreen.addToCart(cartItem);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('${food.name} añadido al carrito'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}
