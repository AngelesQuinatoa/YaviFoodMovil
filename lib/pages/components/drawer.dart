import 'package:flutter/material.dart';
import 'package:project/main.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Angeles Quinatoa'),
            accountEmail: Text('nagelyquinato@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('images/primera.png')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.file_upload),
            title: Text('Subir Fotos'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Perfil'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Subir mensaje'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Subir favoritos'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Compartir'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            ),
          ),
        ],
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
