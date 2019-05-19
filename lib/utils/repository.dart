

import 'package:aplikasi_movie/model/movie_response.dart';
import 'package:aplikasi_movie/utils/movie_provider.dart';

class Repository{

  final _movieProvider = MovieProvider();

  Future<MovieResponse> fetchNowPlaying() => _movieProvider.fetchNowPlayingMovies();
  Future<MovieResponse> fetchtopRated() => _movieProvider.fetchtopRated();
}