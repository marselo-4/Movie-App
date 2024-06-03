import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/common/MediaProvider.dart';
import 'package:movie_app/media_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState(){
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  final MediaProvider movieProvider = MovieProvider();
  final MediaProvider showProvider = ShowProvider();
  late PageController _pageController;
  int _page = 0;

  MediaType mediaType = MediaType.movie;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 116, 31, 0),
        title: const Text('Movie App', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
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
            const DrawerHeader(
              child: Text(
                'Movie App',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text(
                'Peliculas',
                style: TextStyle(color: Colors.white),
              ),
              selected: mediaType == MediaType.movie,
              onTap: () {
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop();
              },
              leading: const Icon(
                Icons.movie,
                color: Colors.white,
              ),
            ),
            ListTile(
              title: const Text(
                'Televisión',
                style: TextStyle(color: Colors.white),
              ),
              selected: mediaType == MediaType.show,
              leading: const Icon(
                Icons.tv,
                color: Colors.white,
              ),
              onTap: () {
                _changeMediaType(MediaType.show);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text(
                'Cerrar',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
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
        children: _getMediaList(),
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
            _page = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: getFooterItems(),
        onTap: _navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  List<BottomNavigationBarItem> getFooterItems() {
    return mediaType == MediaType.movie ? [
      const BottomNavigationBarItem(
        icon: Icon(Icons.thumb_up),
        label: 'Populares',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.update),
        label: 'Próximamente',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: 'Mejor Valoradas',
      ),]
      : [
            const BottomNavigationBarItem(
        icon: Icon(Icons.thumb_up),
        label: 'Populares',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.update),
        label: 'En el Aire',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: 'Mejor Valoradas',
      ),
    ];
  }

  void _changeMediaType(MediaType type){
    if(mediaType != type){setState(() {
      mediaType = type;
    });}
  }

  List<Widget> _getMediaList(){
    return (mediaType == MediaType.movie ? <Widget>[
      MediaList(movieProvider, "popular"),
      MediaList(movieProvider, "upcoming"),
      MediaList(movieProvider, "top_rated")
    ] : <Widget>[
      MediaList(showProvider, "popular"),
      MediaList(showProvider, "airing_today"),
      MediaList(showProvider, "top_rated")
    ]);
  }

  void _navigationTapped(int page){
    _pageController.animateToPage(page, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
