import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movie_db_app/domain/api/TMDB_API.dart';
import 'package:movie_db_app/domain/models/popular_movie_model.dart';

import 'package:movie_db_app/utils/consts/api_consts.dart';


class PopularMoviesRepo implements ITMDBApi {
  @override
  Future<List<Result>> getData() async {
    final http.Response response = await http.get(
      Uri.parse(
          '${ApiConsts.BASE_URL}/movie/popular?api_key=${ApiConsts.APIKEY}&language=${ApiConsts.language}'),
    );

    if (response.statusCode == 200) {
      print(response.body);
      final jsonData = json.decode(response.body);

      //! Создаём модель `PopularMovieModel` из JSON
      final popularMovies = PopularMovieModel.fromJson(jsonData);

      //! Возвращаем список фильмов (`results`)
      return popularMovies.results;
    } else {
      throw Exception('Ошибка при загрузке фильмов');
    }
  }
}
