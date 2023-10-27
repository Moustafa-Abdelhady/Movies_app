import 'package:movies_app/movies/domain/use_case/get_movies_details_usecase.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/error_msg_model.dart';
import '../../domain/use_case/get_movies_details_recommendation_usecase.dart';
import '../models/movies_details_model.dart';
import '../models/movies_details_recommendation_model.dart';
import '../models/movies_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MoviesDetailsModel> getMoviesDetails(
      MoviesDetailsParameters parameters);

  Future<List<RecommendationModel>> getMoviesDetailsRecommendation(
      RecommendationParameters parameters);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await ApiService.dio.get(ApiService.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      final data = List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );

      return data;
    } else {
      throw ServerException(
        errorMsgModel: ErrorMsgModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await ApiService.dio.get(ApiService.popularMoviesPath);

    if (response.statusCode == 200) {
      final data = List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );

      return data;
    } else {
      throw ServerException(
        errorMsgModel: ErrorMsgModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await ApiService.dio.get(ApiService.topRatedMoviesPath);

    if (response.statusCode == 200) {
      final data = List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );

      return data;
    } else {
      throw ServerException(
        errorMsgModel: ErrorMsgModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MoviesDetailsModel> getMoviesDetails(
      MoviesDetailsParameters parameters) async {
    final response = await ApiService.dio
        .get(ApiService.moviesDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      final data = MoviesDetailsModel.fromJson(
        response.data,
      );

      return data;
    } else {
      throw ServerException(
        errorMsgModel: ErrorMsgModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getMoviesDetailsRecommendation(
      RecommendationParameters parameters) async {
    final response = await ApiService.dio
        .get(ApiService.moviesDetailsRecommendationPath(parameters.id));

    if (response.statusCode == 200) {
      final data = List<RecommendationModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
      return data;
    } else {
      throw ServerException(
        errorMsgModel: ErrorMsgModel.fromJson(response.data),
      );
    }
  }
}
