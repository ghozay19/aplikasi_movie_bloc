import 'package:aplikasi_movie/bloc/movie_bloc.dart';
import 'package:aplikasi_movie/model/movie_response.dart';
import 'package:aplikasi_movie/widget/IntroPageItem.dart';
import 'package:aplikasi_movie/widget/page_transformer.dart';
import 'package:flutter/material.dart';

class Upcoming extends StatefulWidget {
  static final String routeName = '/nowPlaying';

  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  void initState() {
    super.initState();
    movieBloc.fetchUpcoming();
    print('init: upcoming');
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies: upcoming');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print('dispose: upcoming');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<MovieResponse>(
        stream: movieBloc.upComingStream,
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
//                child: Center(child:
//                CircularProgressIndicator())
            );
          }
        },
      ),
    );
  }
}


