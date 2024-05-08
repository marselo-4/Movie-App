// Deserialize Json

import 'package:movie_app/common/util.dart';

class Media {
  int id = 0;
  double voteAverage = 0.0;
  String title = "";
  String posterPath = "";
  String backdropPath = "";
  String overview = "";
  String releaseDate = "";
  List<dynamic> genreIds = [];

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackdropUrl() => getLargePictureUrl(backdropPath);
  String getGenres() => getGenreValues(genreIds);
  factory Media(Map jsonMap) {
    try {
      return new Media.deserialize(jsonMap);
    } catch (e) {
      throw e;
    }
  }

  Media.deserialize(Map jsonMap) {
    id = jsonMap["id"];
    voteAverage = jsonMap["vote_average"];
    title = jsonMap["title"];
    posterPath = jsonMap["poster_path"];
    backdropPath = jsonMap["backdrop_path"];
    overview = jsonMap["overview"];
    releaseDate = jsonMap["release_date"];
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
