import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/use_case/get_movies_details_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movies.dart';
import '../entities/movies_details.dart';
import '../entities/recommendation.dart';
import '../use_case/get_movies_details_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

  Future<Either<Failure, MoviesDetails>> getMoviesDetails(MoviesDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getMoviesDetailsRecommendation(RecommendationParameters parameters );
}
