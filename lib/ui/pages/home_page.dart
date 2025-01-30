

import 'package:flutter/material.dart';
import 'package:movie_db_app/domain/api/repositories/popular_movies_repo.dart';
import 'package:movie_db_app/domain/models/popular_movie_model.dart';

import 'package:movie_db_app/domain/providers/movie_provider.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieData = PopularMoviesRepo();
    final movieProvider = context.watch<MovieProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie DB'),
      ),
      body: FutureBuilder<List<Result>>(
        future: movieProvider.fetchPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Нет данных о фильмах'));
          }

          final movies = snapshot.data!;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return ListTile(
                title: Text(movie.originalTitle ?? 'Без названия'),
                subtitle: Text('Рейтинг: ${movie.voteAverage?.toString() ?? 'Нет данных'}'),
                leading: movie.posterPath != null
                    ? Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        width: 50,
                        height: 75,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.movie),
              );
            },
          );
        },
      ),
    );
  }
}
