
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:internet_radio/services/player_provider.dart';
import 'package:internet_radio/utils/hex_color.dart';
import 'package:provider/provider.dart';

class NowPlayingTemplate extends StatelessWidget {
  final String radioTitle;
  final String radioImageURL;

  NowPlayingTemplate({Key key, this.radioTitle, this.radioImageURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: new HexColor("#ffffff")),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _nowPlayingText(context, this.radioTitle, 'assets/imagesapp/Mindalae.png',),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nowPlayingText(BuildContext context, String title, String imageURL) {
   
    return new Container(
      
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      
      child: Row(children: [
        Expanded(
          child: Column(
          children: [
         
          Image(image: AssetImage(imageURL),alignment: Alignment.center,height: 150,),
         
         Center(child: Row(children: [Text("Detener",style: new TextStyle(
            fontWeight: FontWeight.bold,fontSize: 30),), _buildStopIcon(context),],mainAxisAlignment: MainAxisAlignment.center,),) 
        ],
        )
        ),
      ],),
       
      
    );
  }

  

  Widget _buildStopIcon(BuildContext context) {
    var playerProvider = Provider.of<PlayerProvider>(context, listen: false);

    return IconButton(
      icon: Icon(Icons.pause_circle),
      color: HexColor("#068c3f"),
      iconSize: 40,
      onPressed: () {
        playerProvider.stopRadio();
      },
    );
  }

  
}
