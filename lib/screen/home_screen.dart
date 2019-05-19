import 'package:aplikasi_movie/widget/top_rated.dart';
import 'package:flutter/material.dart';

import '../now_playing.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(),
      body: Column(
        children: <Widget>[
//          NowPlaying(),
          Container(
              height: 270.0,
              child: TopRated()),

          Container(
              height: 450.0,
//              child: NowPlaying()),
          )
        ],
      ),
    );
  }
}
c