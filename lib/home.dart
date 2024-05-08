import 'package:flutter/material.dart';
import 'package:movie_app/media_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 116, 31, 0),
        title: Text('Movie App', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              print('Search');
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 116, 31, 0),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Movie App',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text(
                'Peliculas',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
              leading: Icon(
                Icons.movie,
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Text(
                'Televisión',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.tv,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Cerrar',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: PageView(
        children: <Widget>[
          MediaList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: getFooterItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> getFooterItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.thumb_up),
        label: 'Populares',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.update),
        label: 'Próximamente',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: 'Mejor Valoradas',
      ),
    ];
  }
}
