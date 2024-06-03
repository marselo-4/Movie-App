import 'package:movie_app/common/HttpHandler.dart';

import '../model/Media.dart';

abstract class MediaProvider{
  Future<List<Media>> fetchMedia();
}

class MovieProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia() {
    return _client.fetchMovies();
  }
}

class TVProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia() {
    return _client.fetchShow();
  }
}