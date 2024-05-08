import 'package:flutter/material.dart';
import 'package:movie_app/model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;
  MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: "assets/500x281.jpg",
                image: media.getBackdropUrl(),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
                fadeInDuration: Duration(milliseconds: 1000),
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900]?.withOpacity(0.65),
                  ),
                  constraints: BoxConstraints.expand(height: 55.0),
                ),
              ),
              Positioned(
                  left: 10.0,
                  bottom: 30.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          media.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18.0),
                        ),
                      )
                    ],
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
