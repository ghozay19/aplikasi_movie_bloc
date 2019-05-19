import 'package:aplikasi_movie/bloc/movie_bloc.dart';
import 'package:aplikasi_movie/model/movie_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TopRated extends StatefulWidget {
  @override
  _TopRatedState createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  void initState() {
    super.initState();
    movieBloc.fetchTopRated();
    print('init: nowPlaying');
  }



  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
        child: StreamBuilder<MovieResponse>(
            stream: movieBloc.topRatedStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data.results.length);
                return Swiper(
                  transformer: ScaleAndFadeTransformer(
                    fade: 20.0,
                    scale: 10.0
                  ),
                  viewportFraction: 0.8,
                  scale: 0.9,
                  autoplay: true,
                  pagination: SwiperPagination(),
                  itemCount: snapshot.data.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    var bdpath = snapshot.data.results[index].backdropPath;
//                    print('judul  : ' + snapshot.data.results[index].title);

                      return Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.network(
                            'https://image.tmdb.org/t/p/w500$bdpath',
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            bottom: 56.0,
                            left: 32.0,
                            right: 32.0,
                            child: Text(
                              snapshot.data.results[index].title,
                              style: textTheme.title
                                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),

                        ],
                      );
                  },
                );
              } else {
                return Text(snapshot.error.toString());
              }
            }));
  }
}
