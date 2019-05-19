import 'package:aplikasi_movie/bloc/bloc_helper/bloc_provider.dart';
import 'package:aplikasi_movie/bloc/movie_bloc.dart';
import 'package:aplikasi_movie/now_playing.dart';
import 'package:aplikasi_movie/screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:aplikasi_movie/utils/colors.dart';

void main() => runApp(MyApp());


final ThemeData _theme = _buildTheme();

ThemeData _buildTheme(){
  final ThemeData base  = ThemeData.light();
   return base.copyWith(
     primaryColor: primaryColor1,
      accentColor: primaryColor2,

     iconTheme: IconThemeData(
       color: Colors.white
     ),
     bottomAppBarColor: classySubColor2,

   );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(
      bloc: MovieBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        title: "Apps Movie",
        theme: _theme,
          // routes: routes,
          // navigatorKey: globalBloc.navigatorKey,
        home: HomeScreen(),
        ),
    );
  }
}
