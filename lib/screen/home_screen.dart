import 'package:aplikasi_movie/widget/top_rated.dart';
import 'package:aplikasi_movie/widget/upcoming.dart';
import 'package:flutter/material.dart';

import '../now_playing.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
//          NowPlaying(),
          Container(
              height: 270.0,
              child: TopRated()),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text('Now Playing',style: TextStyle(fontSize: 16),),
          ),
          Container(
              height: 250.0,
              child: NowPlaying()),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text('Upcoming',style: TextStyle(fontSize: 16),),
          ),
          Container(
            height: 250.0,
            child: Upcoming(),
          )

        ],
      ),
    );
  }
}
