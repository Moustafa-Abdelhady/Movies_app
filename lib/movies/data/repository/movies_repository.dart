import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/use_case/get_movies_details_recommendation_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/use_case/get_movies_details_usecase.dart';

import '../../../core/error/exception.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../data_source/movies_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final response = await baseMoviesRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMsgModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final response = await baseMoviesRemoteDataSource.getPopularMovies();

    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMsgModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final response = await baseMoviesRemoteDataSource.getTopRatedMovies();

    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMsgModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(
      MoviesDetailsParameters parameters) async {
    final response =
        await baseMoviesRemoteDataSource.getMoviesDetails(parameters);

    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMsgModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMoviesDetailsRecommendation(
      RecommendationParameters parameters) async {
    final response = await baseMoviesRemoteDataSource
        .getMoviesDetailsRecommendation(parameters);

    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMsgModel.statusMessage),
      );
    }
  }
}


