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
