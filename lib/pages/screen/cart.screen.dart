import 'package:flutter/material.dart';
import '../../models/food_model.dart';

class CartItem {
  final Food food;
  int quantity;
  double totalPrice;

  CartItem({required this.food, required this.quantity, required this.totalPrice});
}

class CartScreen extends StatefulWidget {
  static List<CartItem> cartItems = [];

  static void addToCart(CartItem cartItem) {
    final existingIndex = cartItems.indexWhere((item) => item.food.id == cartItem.food.id);
    if (existingIndex != -1) {
      final existingItem = cartItems[existingIndex];
      existingItem.quantity += cartItem.quantity;
      existingItem.totalPrice += cartItem.totalPrice;
    } else {
      cartItems.add(cartItem);
    }
  }

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
      ),
      body: ListView.builder(
        itemCount: CartScreen.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = CartScreen.cartItems[index];
          return ListTile(
            leading: Container(
              width: 80, // Tamaño deseado de la imagen
              height: 80, // Tamaño deseado de la imagen
              child: Image.network(
                cartItem.food.imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'images/food-1.jpg',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            title: Text(cartItem.food.name),
            subtitle: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (cartItem.quantity > 1) {
                        cartItem.quantity--;
                        cartItem.totalPrice = cartItem.food.price * cartItem.quantity.toDouble();
                      }
                    });
                  },
                ),
                Text('${cartItem.quantity}'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      cartItem.quantity++;
                      cartItem.totalPrice = cartItem.food.price * cartItem.quantity.toDouble();
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      CartScreen.cartItems.removeAt(index);
                    });
                  },
                ),
              ],
            ),
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
    for (var cartItem in CartScreen.cartItems) {
      total += cartItem.totalPrice;
    }
    return total;
  }
}
