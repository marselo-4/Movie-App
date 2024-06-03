import 'package:movie_app/common/MediaProvider.dart';
import 'package:movie_app/common/util.dart';

class Cast{
  int id;
  String name;
  String profilepath;

  String getCastUrl() => getMediumPictureUrl(profilepath);


  factory Cast(Map jsonMap, MediaType mediaType) {
    try {
      return Cast.deserialize(jsonMap, mediaType);
    } catch (e) {
      throw e;
    }
  }

  Cast.deserialize(Map jsonMap, MediaType mediaType) : 
  id = (mediaType == MediaType.movie ? jsonMap["cast_id"].toInt() : jsonMap["id"].toInt()),
  name = jsonMap["name"],
  profilepath = jsonMap["profile_path"] ?? "";
}