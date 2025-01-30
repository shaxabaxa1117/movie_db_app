

/* //! доплнительные виды работы с MovieService
class MovieService {
  final MovieRepository _movieRepository;

  MovieService(this._movieRepository);

  Future<List<Movie>> getMovies() async {
    return await _movieRepository.getMovies();
  }

  Future<Movie> getMovieById(int id) async {
    return await _movieRepository.getMovieById(id);
  }

  Future<void> addMovie(Movie movie) async {
    return await _movieRepository.addMovie(movie);
  }

  Future<void> updateMovie(Movie movie) async {
    return await _movieRepository.updateMovie(movie);
  }

  Future<void> deleteMovie(int id) async {
    return await _movieRepository.deleteMovie(id);
  }
}

*/

