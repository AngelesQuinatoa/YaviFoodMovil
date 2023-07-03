import 'package:flutter/material.dart';
import 'package:project/pages/screen/cart.screen.dart';
import '../components/drawer.dart';
import '../components/navbar.dart';


class UserProfileScreen extends StatelessWidget {

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
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 249, 249, 249).withOpacity(0.2), // Color de fondo plomo con poca opacidad
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 160, // Altura de la portada
              color: Colors.grey[300], // Color de la portada
            ),
          ),
          Positioned(
            top: 120,
            left: (MediaQuery.of(context).size.width - 120) / 2,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 179, 177, 177),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  '../images/perfil.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 16,
            right: 16,
            bottom: 0, // Ajuste para expandir la tarjeta hasta abajo
            child: Card(
              elevation: 5,
              shadowColor: Colors.black.withOpacity(0.9), // Sombra de color negro bajito
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Carlos Alesandro Flores Téran',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Nombre: Jinson',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Correo electrónico: jinson@example.com',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Ubicación: Ciudad XYZ',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () {
                          // Acción al presionar el botón
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Salir',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    ),
  );
}
}