import 'package:flutter/material.dart';
import 'package:movie_app/cast_scroller.dart';
import 'package:movie_app/common/MediaProvider.dart';
import 'package:movie_app/model/Media.dart';
import 'dart:ui' as ui;

class MediaDetail extends StatelessWidget {
final Media media;
final MediaProvider provider;
MediaDetail(this.media, this.provider);

 @override
 Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          media.getBackdropUrl(),
          fit: BoxFit.cover,
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 390.0,
                    height: 390.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        media.getPosterUrl(),
                      )
                    ),
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 15, offset: Offset(0, 10))]
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text(
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontFamily: 'Arvo'
                        ),
                        media.title,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                      )),
                      Text(
                        '${media.voteAverage.toStringAsPrecision(2)} / 10',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Arvo'
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      media.overview,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 8,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontFamily: 'Arvo'
                      ),
                    )
                  ],
                ),
                CastController(provider, media.id)
              ],
            ),
          ),
        ),
      ],
    ),
 );
 }
}