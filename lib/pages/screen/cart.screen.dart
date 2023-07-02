import 'package:flutter/material.dart';
import '../../models/food_model.dart';

class CartItem {
  final Food food;
  final int quantity;
  final double totalPrice;

  CartItem({required this.food, required this.quantity, required this.totalPrice});
}

class CartScreen extends StatelessWidget {
  static List<CartItem> cartItems = []; // Lista para almacenar los productos en el carrito

  static void addToCart(CartItem cartItem) {
    cartItems.add(cartItem); // Agregar el producto al carrito
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            leading: Image.network(
              cartItem.food.imageUrl,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'images/food-1.jpg',
                  fit: BoxFit.cover,
                );
              },
            ),
            title: Text(cartItem.food.name),
            subtitle: Text('Cantidad: ${cartItem.quantity}'),
            trailing: Text('\$${cartItem.totalPrice.toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total: \$${calculateTotalPrice().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Funcionalidad para realizar el pago
                },
                child: Text('Pagar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static double calculateTotalPrice() {
    double total = 0;
    for (var cartItem in cartItems) {
      total += cartItem.totalPrice;
    }
    return total;
  }
}
