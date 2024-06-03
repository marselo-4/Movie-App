// ignore_for_file: must_be_immutable, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/common/MediaProvider.dart';
import 'package:movie_app/media_detail.dart';
import 'package:movie_app/model/Media.dart';
import 'package:movie_app/media_list_item.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  String categoria;
  MediaList(this.provider, this.categoria);

  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = [];

  @override
  void initState() {
    super.initState();
    loadMedia();
  }

  @override
  void didUpdateWidget(MediaList oldWidget){
    if(oldWidget.provider.runtimeType != widget.provider.runtimeType){
      _media = [];
      loadMedia();
    }
    super.didUpdateWidget(oldWidget);
  }

  void loadMedia() async {
    var media = await widget.provider.fetchMedia(widget.categoria);
    setState(() {
      _media.addAll(media);
    });
  }

   @override
   Widget build(BuildContext context) {
     return ListView.builder(
       itemCount: _media.length,
       itemBuilder: (BuildContext context, int index) {
        return Container(
          width: double.infinity,
         child:  TextButton (
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            
          ),
          child: MediaListItem(_media[index]),
           onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return MediaDetail(_media[index], widget.provider);
         },
         ));}));
       },
     );
   }
}
