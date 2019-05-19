import 'package:aplikasi_movie/bloc/movie_bloc.dart';
import 'package:aplikasi_movie/widget/page_transformer.dart';
import 'package:flutter/material.dart';

import 'model/movie_response.dart';
import 'widget/IntroPageItem.dart';

class NowPlaying extends StatefulWidget {
  static final String routeName = '/nowPlaying';

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  void initState() {
    super.initState();
    movieBloc.fetchNowPlaying();
    print('init: nowPlaying');
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies: nowPlaying');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print('dispose: nowPlaying');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<MovieResponse>(
        stream: movieBloc.nowPlayingStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.results[0].title);
            print(snapshot.data.results.length);
                return SizedBox.fromSize(
                  size: Size.fromHeight(250.0),
                  child: PageTransformer(
                    pageViewBuilder: (context, visibilityResolver){
                      return PageView.builder(
                        controller: PageController(viewportFraction: 0.85),
                          itemCount: snapshot.data.results.length,
                          itemBuilder: (context, index){
                          final item = snapshot.data.results[index];
                          final pageVisibility = visibilityResolver.resolvePageVisibility(index);

                          return IntroPageItem(
                            item: item,
                            pageVisibility: pageVisibility
                          );
                          });
                    },
                  ),
                );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Container(
                padding: EdgeInsets.all(20.0),
                child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}


