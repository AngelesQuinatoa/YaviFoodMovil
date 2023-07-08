import 'package:flutter/material.dart';
import 'package:project/pages/components/drawer.dart';
import 'package:project/pages/home.dart';
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
    body: ListView.builder(
      itemCount: CartScreen.cartItems.length,
      itemBuilder: (context, index) {
        final cartItem = CartScreen.cartItems[index];
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: ClipOval(
              child: Container(
                width: 60,
                height: 120,
                child: Image.network(
                  cartItem.food.imageUrl,
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
          ),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Screen5(),
              ),
            );
          },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 232, 153, 88),
              ),
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
