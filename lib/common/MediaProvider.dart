import 'package:movie_app/common/HttpHandler.dart';
import 'package:movie_app/model/Casts.dart';

import '../model/Media.dart';

abstract class MediaProvider{
  Future<List<Media>> fetchMedia(String categoria);
  Future<List<Cast>> fetchCast(int mediaId);
}

class MovieProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String categoria) {
    return _client.fetchMovies(categoria: categoria);
  }
  
  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditMovies(mediaId: mediaId);
  }
}

class ShowProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String categoria) {
    return _client.fetchShow(categoria: categoria);
  }
  
  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditShows(mediaId: mediaId);
  }
}

enum MediaType{
  movie,
  show
}