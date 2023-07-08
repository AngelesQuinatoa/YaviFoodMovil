import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/pages/screen/cart.screen.dart';
import 'package:project/pages/screen/perfil.dart';

import '../home.dart';
import 'package:project/pages/screen/comida.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 232, 153, 88)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/principal.jpg'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Me alegra tenerte aquí!!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Lobster',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 249, 249),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.black),
                title: Text(
                  'Inicio',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodList()),
                  );
                },
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 249, 249),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Icon(Icons.shopping_cart, color: Colors.black),
                title: Text(
                  'Carrito',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 249, 249),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.black),
                title: Text(
                  'Perfil',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfileScreen()),
                  );
                },
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 249, 249),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.black),
                title: Text(
                  'Salir',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 80,
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
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
            Spacer(),
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer(); // Abre el Drawer
              },
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 232, 153, 88),
                radius: 18,
                child: ClipOval(
                  child: Image.asset(
                    'images/perfil.jpeg',
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
