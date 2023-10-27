import 'package:dio/dio.dart';

class ApiService {
  static Dio dio = Dio();

  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String apiKey = 'd6518ef44ca55b46bef1e27ac29f3975';

  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String moviesDetailsPath(int movieId) =>
    '$baseUrl/movie/$movieId?api_key=$apiKey';
  
  static String moviesDetailsRecommendationPath(int movieId) =>
    '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';
  

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
