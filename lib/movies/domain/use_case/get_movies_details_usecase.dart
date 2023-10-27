import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<MoviesDetails, MoviesDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MoviesDetails>> call(MoviesDetailsParameters parameters) async {
    return await baseMoviesRepository.getMoviesDetails(parameters);
  }
}

class MoviesDetailsParameters extends Equatable {
  final int movieId;

  const MoviesDetailsParameters({required this.movieId});
  
  @override
  
  List<Object?> get props => [movieId];
}
