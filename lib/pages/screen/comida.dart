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
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/principal.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                backgroundColor: Colors.white,
                pinned: true,
              ),
            ];
          },
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Busca tu platillo',
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: false,
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 232, 153, 88),
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder<List<Food>>(
                future: foodService.getAllFoods(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final foods = snapshot.data!;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 50 / 90,
                      ),
                      itemCount: foods.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
                                  height: 150,
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
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        food.name,
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Origen: ${food.origins.join(", ")}',
                                        style: TextStyle(fontSize: 14),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 5),
                                      Wrap(
                                        spacing: 1,
                                        children: food.tags
                                            .map(
                                              (tag) => Chip(
                                                label: Text(tag),
                                                backgroundColor: Colors.blue,
                                                labelStyle: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                      SizedBox(height: 4),
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
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}
