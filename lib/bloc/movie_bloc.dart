import 'package:aplikasi_movie/bloc/bloc_helper/bloc_provider.dart';
import 'package:aplikasi_movie/model/movie_response.dart';
import 'package:aplikasi_movie/utils/repository.dart';
import 'package:rxdart/rxdart.dart';


class MovieBloc implements BlocBase{

final _repository = Repository();


final _nowPlayingSubject = BehaviorSubject<MovieResponse>();
Function(MovieResponse) get nowPlayingSink => _nowPlayingSubject.sink.add;
Observable<MovieResponse> get nowPlayingStream => _nowPlayingSubject.stream;

final _topRatedSubject = BehaviorSubject<MovieResponse>();
Function(MovieResponse) get topRatedSink => _topRatedSubject.sink.add;
Observable<MovieResponse> get topRatedStream => _topRatedSubject.stream;


fetchNowPlaying() async{
  MovieResponse movieResponse = await _repository.fetchNowPlaying();
  nowPlayingSink(movieResponse);
}

fetchTopRated() async{
  MovieResponse movieResponse = await _repository.fetchtopRated();
  topRatedSink(movieResponse);
}

  @override
  void dispose() {
    _nowPlayingSubject.close();
    _topRatedSubject.close();
  }

}

final movieBloc = MovieBloc();