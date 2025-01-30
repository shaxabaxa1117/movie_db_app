import 'package:flutter/material.dart';
import 'package:movie_db_app/domain/api/repositories/popular_movies_repo.dart';

import 'package:movie_db_app/domain/models/popular_movie_model.dart';


class MovieProvider extends ChangeNotifier {
  final PopularMoviesRepo _popularMoviesRepo = PopularMoviesRepo();


// final List<PopularMovieModel> _popularMovies = [];
// final List<RatedMoviesModel> _topRatedMovies = [];

// List<PopularMovieModel> get popularMovies => _popularMovies;
// List<RatedMoviesModel> get topRatedMovies => _topRatedMovies;

Future<List<Result>> fetchPopularMovies() async {
  try {
    var data = await _popularMoviesRepo.getData();
    return data;
  } catch (e) {
    print('Ошибка при загрузке популярных фильмов: $e');
    return []; // Возвращаем пустой список вместо null
  }
}
}
