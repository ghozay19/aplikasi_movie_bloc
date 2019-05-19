import 'dart:convert';

import 'package:aplikasi_movie/model/movie_response.dart';
import 'package:http/http.dart' show Client;

class MovieProvider{

  static String apiKey = "ed1f1b69630ec5a7109bca52edb898f9";

  static String baseUrl = "https://api.themoviedb.org/3/movie";

  static String nowPlaying = "/now_playing?api_key="+apiKey+"&language=en-EN&page=1&region=id";

//  static String upComing = "/upcoming?api_key="+apiKey+"&language=id-ID&page=1&region=id";
  static String upComing = "/upcoming?api_key="+apiKey;

  static String trailerMovie = "/299534/videos?api_key="+apiKey+"&language=en-EN";

  static String popularMovie = "/popular?api_key="+apiKey+"&language=en-US&page=1";

  // static String detailMovie = "/{movie_id}?api_key=ed1f1b69630ec5a7109bca52edb898f9&language=en-US";

  static String topRatedMovie = "/top_rated?api_key="+apiKey+"&language=en-US&page=1&region=id";
//  https://api.themoviedb.org/3/movie/top_rated?api_key=ed1f1b69630ec5a7109bca52edb898f9
  Client client = Client();

  Future<MovieResponse> fetchtopRated() async{

    final response = await client.get(baseUrl+popularMovie);
    if (response.statusCode == 200) {
      print('response statusCode = 200')  ;
      Map jsons = jsonDecode(response.body);
      MovieResponse movieResponse = MovieResponse.fromJson(jsons);

      print('topRated = '+ jsons.toString());
      return movieResponse;
    } else {
      throw('can not fetch data');
    }

  }


  Future<MovieResponse> fetchNowPlayingMovies() async{

    final response = await client.get(baseUrl+nowPlaying);

    // try{
      if (response.statusCode == 200) {
        print('response statusCode = 200')  ;
        Map jsons = jsonDecode(response.body);
        MovieResponse movieResponse = MovieResponse.fromJson(jsons);

        print('nowPlaying = '+ jsons.toString());
        return movieResponse;
      } else {
        throw('can not fetch data');
      }
  //   }catch(e){
  //       print('Error !')
  //   }

  // }
  } Future<MovieResponse> fetchUpcomingMovies() async{

    final response = await client.get(baseUrl+upComing);

    // try{
      if (response.statusCode == 200) {
        print('response statusCode = 200')  ;
        Map jsons = jsonDecode(response.body);
        MovieResponse movieResponse = MovieResponse.fromJson(jsons);

        print('upcoming = '+ jsons.toString());
        return movieResponse;
      } else {
        throw('can not fetch data');
      }
  //   }catch(e){
  //       print('Error !')
  //   }

  // }
  }
}