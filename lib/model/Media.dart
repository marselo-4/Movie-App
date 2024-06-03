// Deserialize Json

import 'package:movie_app/common/util.dart';

class Media {
  int id = 0;
  double voteAverage = 0;
  String title = "";
  String posterPath = "";
  String backdropPath = "";
  String overview = "";
  String releaseDate = "";
  List<dynamic> genreIds = [];

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackdropUrl() => getLargePictureUrl(backdropPath);
  String getGenres() => getGenreValues(genreIds);

  int getReleaseYear(){
    if(releaseDate.isEmpty) return 0;

    return DateTime.parse(releaseDate).year;
  }

  factory Media(Map jsonMap, MediaType mediaType) {
    try {
      return Media.deserialize(jsonMap, mediaType);
    } catch (e) {
      throw e;
    }
  }

  Media.deserialize(Map jsonMap, MediaType mediaType) {
    id = jsonMap["id"];
    voteAverage = jsonMap["vote_average"];
    title = jsonMap["title"];
    posterPath = jsonMap["poster_path"];
    backdropPath = jsonMap["backdrop_path"];
    overview = jsonMap["overview"];
    releaseDate = jsonMap[mediaType == MediaType.movie ? "release_date" : "first_air_date"];
    genreIds = jsonMap["genre_ids"];  
  }

  // : id = json.["id"].toInt(),
  //   voteAverage = json["vote_average"].toDouble(),
  //   title = json["title"],
  //   posterPath = json["poster_path"] ?? "",
  //   backdropPath = json["backdrop_path"] ?? "",
  //   overview = json["overview"],
  //   releaseDate = json["release_date"],
  //   gendreIds = json["genre_ids"].toList();
}

enum MediaType{
  movie,
  show
}