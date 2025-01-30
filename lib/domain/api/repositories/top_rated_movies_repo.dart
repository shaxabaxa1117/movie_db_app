


import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_db_app/domain/api/TMDB_API.dart';
import 'package:movie_db_app/domain/models/rated_movies_model.dart';
import 'package:movie_db_app/utils/consts/api_consts.dart';


//! https://api.themoviedb.org/3/movie/top_rated?api_key=255b6e5eb908ce3d6d365d5bd2674909&language=ru-RU
class TopRatedMoviesRepo implements ITMDBApi{


  @override
  Future<List<RatedMoviesModel>> getData() async {
    final http.Response response = await http.get(
      Uri.parse('${ApiConsts.BASE_URL}/movie/top_rated?api_key=${ApiConsts.APIKEY}&language=${ApiConsts.language}'),
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      

      return jsonData.map((json) => RatedMoviesModel.fromJson(json)).toList();

    } else {
      throw Exception('Ошибка при загрузке топ-рейтинга фильмов');
    }
  }


}


